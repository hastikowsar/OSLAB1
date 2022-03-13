
// Console input and output.
// Input is from the keyboard or serial port.
// Output is written to the screen and serial port.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"

#define KEY_UP          0xE2
#define KEY_LF          0xE4
#define KEY_RT          0xE5


#define INPUT_BUF 128
#define History_MAX     16

char oldBUF [INPUT_BUF];
char tempBUF[INPUT_BUF];
char buf[INPUT_BUF];

static void consputc(int);

static int panicked = 0;

static struct {
  struct spinlock lock;
  int locking;
} cons;


static void
printint(int xx, int base, int sign)
{
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
    consputc(buf[i]);
}
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
      consputc(c);
      break;
    }
  }

  if(locking)
    release(&cons.lock);
}

void
panic(char *s)
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
  for(;;)
    ;
}

//PAGEBREAK: 50
#define BACKSPACE 0x100
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

struct {
  char buf[INPUT_BUF];
  uint r;  // Read index
  uint w;  // Write index
  uint e;  // Edit index
  uint pos;
} input;

#define C(x)  ((x)-'@')  // Control-x

struct {
  char buf[History_MAX][INPUT_BUF];
  uint BUF_L[History_MAX];
  uint lastcomm;
  int commNUM;
  int History;
}HistoryBUF;


void SaveHistory(){

  uint length = input.pos - input.r - 1;
  if (length == 0) return;
  
  HistoryBUF.History = -1;
  if(HistoryBUF.commNUM < History_MAX)
    HistoryBUF.commNUM++;
    
  HistoryBUF.lastcomm = (HistoryBUF.lastcomm - 1) % History_MAX;
  HistoryBUF.BUF_L[HistoryBUF.lastcomm] = length;
  for(uint i =0; i < length;i++){
    HistoryBUF.buf[HistoryBUF.lastcomm][i] = input.buf[(input.r + i) % INPUT_BUF];
  }
}  


static void
cgaputc(int c)
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n'){
    pos += 80 - pos%80;
  }
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
    for(int i = pos; i <= pos - 1 + input.w - input.e; i++)
      crt[i] = ( input.buf[(input.e + i - pos)  % INPUT_BUF] &0xff) | 0x0700;
  } else if (c == KEY_LF){
    if(pos > 0) --pos;
  } else if (c == KEY_RT){
    ++pos;
  /*} else if (c == KEY_UP){
    if(HisCommNUM > 0){
           for(int i=pos ;i < input.e ; i++)
              ++pos;
           while (input.e > input.w){
              --pos;
           }
           pos = input.e;
     }  */
  } else {
 //   for(int i = (pos - pos%80) + INPUT_BUF - 1; i > pos; i--) {
  //    crt[i] = crt[i - 1];
 //   }
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  }
  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
  }

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  if (c != KEY_LF && c != KEY_RT)
  	crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
  if(panicked){
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else if (c == KEY_LF){
    uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}


void
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;
  
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      while(input.e != input.r &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        for( int i = input.e; i <= input.w; i++)
            input.buf[(i-1) % INPUT_BUF] = input.buf[i % INPUT_BUF];  
        input.e--;
        input.w--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
        input.e--;
        input.pos--;
        consputc(BACKSPACE);
      }
      break;
      case KEY_LF:
        if(input.pos > input.r)
        {
          input.pos--;
          consputc(c);
        }
        break;
       
       case KEY_RT:
         
         if(input.pos < input.e)
        {
          input.pos++;
          consputc(c);
        }
        break;
      case KEY_UP:
        if(HistoryBUF.History < HistoryBUF.commNUM - 1){
          uint l = (input.pos - input.r);  
          while (l--)
            consputc(BACKSPACE);
          if (HistoryBUF.History == -1){
            for( uint i = 0; i < (input.pos - input.r); i++)
              oldBUF[i] = input.buf[(input.r + i) % INPUT_BUF];
          }
          input.pos = input.r;
          input.e = input.r;
          
          HistoryBUF.History++;
          uint tempI = (HistoryBUF.lastcomm + HistoryBUF.History) % History_MAX;
          uint length = HistoryBUF.BUF_L[tempI];
          uint j = 0;
          while(length--){
            consputc(HistoryBUF.buf[tempI][j]);
            j++;
          }
          
          for(uint i = 0;i < HistoryBUF.BUF_L[tempI];i++)
            input.buf[(input.r + i) % INPUT_BUF] = HistoryBUF.buf[tempI][i];
          input.e = input.r + HistoryBUF.BUF_L[tempI];
          input.pos = input.e;
          
        //  copyBUFto Screen(HistoryBUF.buf[tempI], HistoryBUF.BUF_L[tempI]);
        //  copyBUFtoBUF(HistoryBUF.buf[tempI], HistoryBUF.BUF_L[tempI]);
        
        }
        break;
       
       case '\n' : case '\r' :
         input.e = input.pos;
      
      
      default:	
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        if ( input.pos > input.e){
          
          uint len = input.pos - input.r;
          for(uint i = 0;i < len;i++)
            oldBUF[i] = input.buf[(input.r + i) % INPUT_BUF];
          
          input.buf[input.e % INPUT_BUF] = c;
          input.e++;
          input.pos++;
          consputc(c);
          
          uint sh = input.pos - input.e;
          for(uint i = 0;i < sh;i++){
            input.buf[(input.e + i) % INPUT_BUF] = tempBUF[i];
            consputc(tempBUF[i]);
          }
          for(uint i = 0;i< INPUT_BUF;i++){
            tempBUF[i] = '\0';
            
          int i = sh;
          while(i--)
            consputc(KEY_LF);
          }
        }
        else {
          input.buf[input.e % INPUT_BUF] = c;
          input.e++;
          input.pos = input.e - input.pos == 1 ? input.e: input.pos;
          consputc(c);
        }
        
        
        if(c == '\n' || c == C('D') || input.pos == input.r+INPUT_BUF){
          SaveHistory();
          input.w = input.pos;
          wakeup(&input.r);
        }
      }
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
  uint target;
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
    consputc(buf[i] & 0xff);
  release(&cons.lock);
  ilock(ip);

  return n;
}

void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;
  
  ioapicenable(IRQ_KBD, 0);
}

