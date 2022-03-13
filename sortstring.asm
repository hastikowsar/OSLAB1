
_sortstring:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
         ans[i] = str[i];     
    }
    return ans;
}

int main(int argc, char *argv[]){
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 18             	sub    $0x18,%esp
  17:	8b 71 04             	mov    0x4(%ecx),%esi

  int length = strlen(argv[1]);
  1a:	ff 76 04             	pushl  0x4(%esi)
  1d:	e8 ae 01 00 00       	call   1d0 <strlen>
  22:	89 c3                	mov    %eax,%ebx
  char *res = malloc(length);
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 44 07 00 00       	call   770 <malloc>
  
  res = sort_string(argv[1], length);
  2c:	58                   	pop    %eax
  2d:	5a                   	pop    %edx
  2e:	53                   	push   %ebx
  2f:	ff 76 04             	pushl  0x4(%esi)
  32:	e8 89 00 00 00       	call   c0 <sort_string>
  save(res, length);
  37:	59                   	pop    %ecx
  38:	5e                   	pop    %esi
  39:	53                   	push   %ebx
  3a:	50                   	push   %eax
  3b:	e8 10 00 00 00       	call   50 <save>
}
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	31 c0                	xor    %eax,%eax
  45:	59                   	pop    %ecx
  46:	5b                   	pop    %ebx
  47:	5e                   	pop    %esi
  48:	5d                   	pop    %ebp
  49:	8d 61 fc             	lea    -0x4(%ecx),%esp
  4c:	c3                   	ret    
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <save>:
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	57                   	push   %edi
  58:	56                   	push   %esi
  59:	53                   	push   %ebx
  5a:	83 ec 14             	sub    $0x14,%esp
  5d:	8b 7d 0c             	mov    0xc(%ebp),%edi
  60:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int fd = open("sort_string.txt", O_CREATE | O_RDWR);
  63:	68 02 02 00 00       	push   $0x202
  68:	68 78 08 00 00       	push   $0x878
  6d:	e8 81 03 00 00       	call   3f3 <open>
    for(int i=0; i<length; i++){
  72:	83 c4 10             	add    $0x10,%esp
    int fd = open("sort_string.txt", O_CREATE | O_RDWR);
  75:	89 c6                	mov    %eax,%esi
    for(int i=0; i<length; i++){
  77:	85 ff                	test   %edi,%edi
  79:	7e 1b                	jle    96 <save+0x46>
  7b:	01 df                	add    %ebx,%edi
  7d:	8d 76 00             	lea    0x0(%esi),%esi
        write(fd, &res[i], 1);
  80:	83 ec 04             	sub    $0x4,%esp
  83:	6a 01                	push   $0x1
  85:	53                   	push   %ebx
  86:	83 c3 01             	add    $0x1,%ebx
  89:	56                   	push   %esi
  8a:	e8 44 03 00 00       	call   3d3 <write>
    for(int i=0; i<length; i++){
  8f:	83 c4 10             	add    $0x10,%esp
  92:	39 fb                	cmp    %edi,%ebx
  94:	75 ea                	jne    80 <save+0x30>
    write(fd, "\n", 1);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 01                	push   $0x1
  9b:	68 88 08 00 00       	push   $0x888
  a0:	56                   	push   %esi
  a1:	e8 2d 03 00 00       	call   3d3 <write>
    close(fd);
  a6:	89 75 08             	mov    %esi,0x8(%ebp)
  a9:	83 c4 10             	add    $0x10,%esp
}
  ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
  af:	5b                   	pop    %ebx
  b0:	5e                   	pop    %esi
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
    close(fd);
  b3:	e9 23 03 00 00       	jmp    3db <close>
  b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bf:	90                   	nop

000000c0 <sort_string>:
char* sort_string(char str[], int length){
  c0:	f3 0f 1e fb          	endbr32 
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	57                   	push   %edi
  c8:	56                   	push   %esi
  c9:	53                   	push   %ebx
  ca:	83 ec 28             	sub    $0x28,%esp
    char *ans = malloc(length);
  cd:	ff 75 0c             	pushl  0xc(%ebp)
char* sort_string(char str[], int length){
  d0:	8b 75 08             	mov    0x8(%ebp),%esi
    char *ans = malloc(length);
  d3:	e8 98 06 00 00       	call   770 <malloc>
    for(int i=0; i<length; i++){
  d8:	83 c4 10             	add    $0x10,%esp
    char *ans = malloc(length);
  db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(int i=0; i<length; i++){
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	85 c0                	test   %eax,%eax
  e3:	7e 58                	jle    13d <sort_string+0x7d>
  e5:	31 c0                	xor    %eax,%eax
  e7:	8d 5e 01             	lea    0x1(%esi),%ebx
  ea:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
  ee:	03 75 0c             	add    0xc(%ebp),%esi
        for(int j=i+1;j<length;j++){
  f1:	8d 78 01             	lea    0x1(%eax),%edi
  f4:	39 7d 0c             	cmp    %edi,0xc(%ebp)
  f7:	74 3e                	je     137 <sort_string+0x77>
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 100:	89 d8                	mov    %ebx,%eax
 102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            if(str[i] > str[j]){ 
 108:	0f b6 10             	movzbl (%eax),%edx
 10b:	38 ca                	cmp    %cl,%dl
 10d:	7d 09                	jge    118 <sort_string+0x58>
                str[i] = str[j];
 10f:	88 53 ff             	mov    %dl,-0x1(%ebx)
                str[j] = temp;
 112:	88 08                	mov    %cl,(%eax)
 114:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
        for(int j=i+1;j<length;j++){
 118:	83 c0 01             	add    $0x1,%eax
 11b:	39 c6                	cmp    %eax,%esi
 11d:	75 e9                	jne    108 <sort_string+0x48>
         ans[i] = str[i];     
 11f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 122:	83 c3 01             	add    $0x1,%ebx
 125:	88 4c 38 ff          	mov    %cl,-0x1(%eax,%edi,1)
 129:	89 f8                	mov    %edi,%eax
        for(int j=i+1;j<length;j++){
 12b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
 12f:	8d 78 01             	lea    0x1(%eax),%edi
 132:	39 7d 0c             	cmp    %edi,0xc(%ebp)
 135:	75 c9                	jne    100 <sort_string+0x40>
         ans[i] = str[i];     
 137:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 13a:	88 0c 07             	mov    %cl,(%edi,%eax,1)
}
 13d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 140:	8d 65 f4             	lea    -0xc(%ebp),%esp
 143:	5b                   	pop    %ebx
 144:	5e                   	pop    %esi
 145:	5f                   	pop    %edi
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    
 148:	66 90                	xchg   %ax,%ax
 14a:	66 90                	xchg   %ax,%ax
 14c:	66 90                	xchg   %ax,%ax
 14e:	66 90                	xchg   %ax,%ax

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 155:	31 c0                	xor    %eax,%eax
{
 157:	89 e5                	mov    %esp,%ebp
 159:	53                   	push   %ebx
 15a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	89 c8                	mov    %ecx,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18e:	0f b6 01             	movzbl (%ecx),%eax
 191:	0f b6 1a             	movzbl (%edx),%ebx
 194:	84 c0                	test   %al,%al
 196:	75 19                	jne    1b1 <strcmp+0x31>
 198:	eb 26                	jmp    1c0 <strcmp+0x40>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 1a             	movzbl (%edx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	38 d8                	cmp    %bl,%al
 1b3:	74 eb                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b5:	29 d8                	sub    %ebx,%eax
}
 1b7:	5b                   	pop    %ebx
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 3a 00             	cmpb   $0x0,(%edx)
 1dd:	74 21                	je     200 <strlen+0x30>
 1df:	31 c0                	xor    %eax,%eax
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ef:	89 c1                	mov    %eax,%ecx
 1f1:	75 f5                	jne    1e8 <strlen+0x18>
    ;
  return n;
}
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	89 d7                	mov    %edx,%edi
 223:	fc                   	cld    
 224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 226:	89 d0                	mov    %edx,%eax
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23e:	0f b6 10             	movzbl (%eax),%edx
 241:	84 d2                	test   %dl,%dl
 243:	75 16                	jne    25b <strchr+0x2b>
 245:	eb 21                	jmp    268 <strchr+0x38>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	31 f6                	xor    %esi,%esi
{
 27b:	53                   	push   %ebx
 27c:	89 f3                	mov    %esi,%ebx
 27e:	83 ec 1c             	sub    $0x1c,%esp
 281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 284:	eb 33                	jmp    2b9 <gets+0x49>
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	6a 00                	push   $0x0
 29b:	e8 2b 01 00 00       	call   3cb <read>
    if(cc < 1)
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 1c                	jle    2c3 <gets+0x53>
      break;
    buf[i++] = c;
 2a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 23                	je     2d8 <gets+0x68>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 1f                	je     2d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	89 fe                	mov    %edi,%esi
 2be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c1:	7c cd                	jl     290 <gets+0x20>
 2c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	8b 75 08             	mov    0x8(%ebp),%esi
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	01 de                	add    %ebx,%esi
 2e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 00                	push   $0x0
 2fe:	ff 75 08             	pushl  0x8(%ebp)
 301:	e8 ed 00 00 00       	call   3f3 <open>
  if(fd < 0)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	78 2b                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 30d:	83 ec 08             	sub    $0x8,%esp
 310:	ff 75 0c             	pushl  0xc(%ebp)
 313:	89 c3                	mov    %eax,%ebx
 315:	50                   	push   %eax
 316:	e8 f0 00 00 00       	call   40b <fstat>
  close(fd);
 31b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	e8 b6 00 00 00       	call   3db <close>
  return r;
 325:	83 c4 10             	add    $0x10,%esp
}
 328:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32b:	89 f0                	mov    %esi,%eax
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33d:	eb e9                	jmp    328 <stat+0x38>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	0f be 02             	movsbl (%edx),%eax
 34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 359:	77 1a                	ja     375 <atoi+0x35>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	89 c8                	mov    %ecx,%eax
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	8b 55 08             	mov    0x8(%ebp),%edx
 38e:	56                   	push   %esi
 38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	85 c0                	test   %eax,%eax
 394:	7e 0f                	jle    3a5 <memmove+0x25>
 396:	01 d0                	add    %edx,%eax
  dst = vdst;
 398:	89 d7                	mov    %edx,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ab:	b8 01 00 00 00       	mov    $0x1,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <exit>:
SYSCALL(exit)
 3b3:	b8 02 00 00 00       	mov    $0x2,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <wait>:
SYSCALL(wait)
 3bb:	b8 03 00 00 00       	mov    $0x3,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <pipe>:
SYSCALL(pipe)
 3c3:	b8 04 00 00 00       	mov    $0x4,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <read>:
SYSCALL(read)
 3cb:	b8 05 00 00 00       	mov    $0x5,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <write>:
SYSCALL(write)
 3d3:	b8 10 00 00 00       	mov    $0x10,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <close>:
SYSCALL(close)
 3db:	b8 15 00 00 00       	mov    $0x15,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <kill>:
SYSCALL(kill)
 3e3:	b8 06 00 00 00       	mov    $0x6,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <exec>:
SYSCALL(exec)
 3eb:	b8 07 00 00 00       	mov    $0x7,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <open>:
SYSCALL(open)
 3f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mknod>:
SYSCALL(mknod)
 3fb:	b8 11 00 00 00       	mov    $0x11,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <unlink>:
SYSCALL(unlink)
 403:	b8 12 00 00 00       	mov    $0x12,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <fstat>:
SYSCALL(fstat)
 40b:	b8 08 00 00 00       	mov    $0x8,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <link>:
SYSCALL(link)
 413:	b8 13 00 00 00       	mov    $0x13,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <mkdir>:
SYSCALL(mkdir)
 41b:	b8 14 00 00 00       	mov    $0x14,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <chdir>:
SYSCALL(chdir)
 423:	b8 09 00 00 00       	mov    $0x9,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <dup>:
SYSCALL(dup)
 42b:	b8 0a 00 00 00       	mov    $0xa,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <getpid>:
SYSCALL(getpid)
 433:	b8 0b 00 00 00       	mov    $0xb,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <sbrk>:
SYSCALL(sbrk)
 43b:	b8 0c 00 00 00       	mov    $0xc,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <sleep>:
SYSCALL(sleep)
 443:	b8 0d 00 00 00       	mov    $0xd,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <uptime>:
SYSCALL(uptime)
 44b:	b8 0e 00 00 00       	mov    $0xe,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    
 453:	66 90                	xchg   %ax,%ax
 455:	66 90                	xchg   %ax,%ax
 457:	66 90                	xchg   %ax,%ax
 459:	66 90                	xchg   %ax,%ax
 45b:	66 90                	xchg   %ax,%ax
 45d:	66 90                	xchg   %ax,%ax
 45f:	90                   	nop

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 3c             	sub    $0x3c,%esp
 469:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 46c:	89 d1                	mov    %edx,%ecx
{
 46e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 471:	85 d2                	test   %edx,%edx
 473:	0f 89 7f 00 00 00    	jns    4f8 <printint+0x98>
 479:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47d:	74 79                	je     4f8 <printint+0x98>
    neg = 1;
 47f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 486:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 488:	31 db                	xor    %ebx,%ebx
 48a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 c8                	mov    %ecx,%eax
 492:	31 d2                	xor    %edx,%edx
 494:	89 cf                	mov    %ecx,%edi
 496:	f7 75 c4             	divl   -0x3c(%ebp)
 499:	0f b6 92 94 08 00 00 	movzbl 0x894(%edx),%edx
 4a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4a3:	89 d8                	mov    %ebx,%eax
 4a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4b1:	76 dd                	jbe    490 <printint+0x30>
  if(neg)
 4b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4b6:	85 c9                	test   %ecx,%ecx
 4b8:	74 0c                	je     4c6 <printint+0x66>
    buf[i++] = '-';
 4ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4cd:	eb 07                	jmp    4d6 <printint+0x76>
 4cf:	90                   	nop
 4d0:	0f b6 13             	movzbl (%ebx),%edx
 4d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4dc:	6a 01                	push   $0x1
 4de:	56                   	push   %esi
 4df:	57                   	push   %edi
 4e0:	e8 ee fe ff ff       	call   3d3 <write>
  while(--i >= 0)
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	39 de                	cmp    %ebx,%esi
 4ea:	75 e4                	jne    4d0 <printint+0x70>
    putc(fd, buf[i]);
}
 4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5f                   	pop    %edi
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ff:	eb 87                	jmp    488 <printint+0x28>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	57                   	push   %edi
 518:	56                   	push   %esi
 519:	53                   	push   %ebx
 51a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 51d:	8b 75 0c             	mov    0xc(%ebp),%esi
 520:	0f b6 1e             	movzbl (%esi),%ebx
 523:	84 db                	test   %bl,%bl
 525:	0f 84 b4 00 00 00    	je     5df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 52b:	8d 45 10             	lea    0x10(%ebp),%eax
 52e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 531:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 534:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 536:	89 45 d0             	mov    %eax,-0x30(%ebp)
 539:	eb 33                	jmp    56e <printf+0x5e>
 53b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
 540:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 543:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	74 17                	je     564 <printf+0x54>
  write(fd, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	88 5d e7             	mov    %bl,-0x19(%ebp)
 553:	6a 01                	push   $0x1
 555:	57                   	push   %edi
 556:	ff 75 08             	pushl  0x8(%ebp)
 559:	e8 75 fe ff ff       	call   3d3 <write>
 55e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 561:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 564:	0f b6 1e             	movzbl (%esi),%ebx
 567:	83 c6 01             	add    $0x1,%esi
 56a:	84 db                	test   %bl,%bl
 56c:	74 71                	je     5df <printf+0xcf>
    c = fmt[i] & 0xff;
 56e:	0f be cb             	movsbl %bl,%ecx
 571:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 574:	85 d2                	test   %edx,%edx
 576:	74 c8                	je     540 <printf+0x30>
      }
    } else if(state == '%'){
 578:	83 fa 25             	cmp    $0x25,%edx
 57b:	75 e7                	jne    564 <printf+0x54>
      if(c == 'd'){
 57d:	83 f8 64             	cmp    $0x64,%eax
 580:	0f 84 9a 00 00 00    	je     620 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 586:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 58c:	83 f9 70             	cmp    $0x70,%ecx
 58f:	74 5f                	je     5f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 591:	83 f8 73             	cmp    $0x73,%eax
 594:	0f 84 d6 00 00 00    	je     670 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59a:	83 f8 63             	cmp    $0x63,%eax
 59d:	0f 84 8d 00 00 00    	je     630 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5a3:	83 f8 25             	cmp    $0x25,%eax
 5a6:	0f 84 b4 00 00 00    	je     660 <printf+0x150>
  write(fd, &c, 1);
 5ac:	83 ec 04             	sub    $0x4,%esp
 5af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	ff 75 08             	pushl  0x8(%ebp)
 5b9:	e8 15 fe ff ff       	call   3d3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5c1:	83 c4 0c             	add    $0xc,%esp
 5c4:	6a 01                	push   $0x1
 5c6:	83 c6 01             	add    $0x1,%esi
 5c9:	57                   	push   %edi
 5ca:	ff 75 08             	pushl  0x8(%ebp)
 5cd:	e8 01 fe ff ff       	call   3d3 <write>
  for(i = 0; fmt[i]; i++){
 5d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5db:	84 db                	test   %bl,%bl
 5dd:	75 8f                	jne    56e <printf+0x5e>
    }
  }
}
 5df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e2:	5b                   	pop    %ebx
 5e3:	5e                   	pop    %esi
 5e4:	5f                   	pop    %edi
 5e5:	5d                   	pop    %ebp
 5e6:	c3                   	ret    
 5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f8:	6a 00                	push   $0x0
 5fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	8b 13                	mov    (%ebx),%edx
 602:	e8 59 fe ff ff       	call   460 <printint>
        ap++;
 607:	89 d8                	mov    %ebx,%eax
 609:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60c:	31 d2                	xor    %edx,%edx
        ap++;
 60e:	83 c0 04             	add    $0x4,%eax
 611:	89 45 d0             	mov    %eax,-0x30(%ebp)
 614:	e9 4b ff ff ff       	jmp    564 <printf+0x54>
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	eb ce                	jmp    5fa <printf+0xea>
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 630:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 636:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 638:	6a 01                	push   $0x1
        ap++;
 63a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 63d:	57                   	push   %edi
 63e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 641:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 644:	e8 8a fd ff ff       	call   3d3 <write>
        ap++;
 649:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 64c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64f:	31 d2                	xor    %edx,%edx
 651:	e9 0e ff ff ff       	jmp    564 <printf+0x54>
 656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 660:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
 666:	e9 59 ff ff ff       	jmp    5c4 <printf+0xb4>
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
        s = (char*)*ap;
 670:	8b 45 d0             	mov    -0x30(%ebp),%eax
 673:	8b 18                	mov    (%eax),%ebx
        ap++;
 675:	83 c0 04             	add    $0x4,%eax
 678:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 67b:	85 db                	test   %ebx,%ebx
 67d:	74 17                	je     696 <printf+0x186>
        while(*s != 0){
 67f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 682:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 684:	84 c0                	test   %al,%al
 686:	0f 84 d8 fe ff ff    	je     564 <printf+0x54>
 68c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68f:	89 de                	mov    %ebx,%esi
 691:	8b 5d 08             	mov    0x8(%ebp),%ebx
 694:	eb 1a                	jmp    6b0 <printf+0x1a0>
          s = "(null)";
 696:	bb 8a 08 00 00       	mov    $0x88a,%ebx
        while(*s != 0){
 69b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 69e:	b8 28 00 00 00       	mov    $0x28,%eax
 6a3:	89 de                	mov    %ebx,%esi
 6a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6b3:	83 c6 01             	add    $0x1,%esi
 6b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	53                   	push   %ebx
 6bd:	e8 11 fd ff ff       	call   3d3 <write>
        while(*s != 0){
 6c2:	0f b6 06             	movzbl (%esi),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x1a0>
 6cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 6cf:	31 d2                	xor    %edx,%edx
 6d1:	e9 8e fe ff ff       	jmp    564 <printf+0x54>
 6d6:	66 90                	xchg   %ax,%ax
 6d8:	66 90                	xchg   %ax,%ax
 6da:	66 90                	xchg   %ax,%ax
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e5:	a1 ac 0b 00 00       	mov    0xbac,%eax
{
 6ea:	89 e5                	mov    %esp,%ebp
 6ec:	57                   	push   %edi
 6ed:	56                   	push   %esi
 6ee:	53                   	push   %ebx
 6ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6f2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f7:	39 c8                	cmp    %ecx,%eax
 6f9:	73 15                	jae    710 <free+0x30>
 6fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop
 700:	39 d1                	cmp    %edx,%ecx
 702:	72 14                	jb     718 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	39 d0                	cmp    %edx,%eax
 706:	73 10                	jae    718 <free+0x38>
{
 708:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	8b 10                	mov    (%eax),%edx
 70c:	39 c8                	cmp    %ecx,%eax
 70e:	72 f0                	jb     700 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 710:	39 d0                	cmp    %edx,%eax
 712:	72 f4                	jb     708 <free+0x28>
 714:	39 d1                	cmp    %edx,%ecx
 716:	73 f0                	jae    708 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 718:	8b 73 fc             	mov    -0x4(%ebx),%esi
 71b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71e:	39 fa                	cmp    %edi,%edx
 720:	74 1e                	je     740 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 722:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 725:	8b 50 04             	mov    0x4(%eax),%edx
 728:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 72b:	39 f1                	cmp    %esi,%ecx
 72d:	74 28                	je     757 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 72f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 731:	5b                   	pop    %ebx
  freep = p;
 732:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
 73b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 740:	03 72 04             	add    0x4(%edx),%esi
 743:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 746:	8b 10                	mov    (%eax),%edx
 748:	8b 12                	mov    (%edx),%edx
 74a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 753:	39 f1                	cmp    %esi,%ecx
 755:	75 d8                	jne    72f <free+0x4f>
    p->s.size += bp->s.size;
 757:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 75a:	a3 ac 0b 00 00       	mov    %eax,0xbac
    p->s.size += bp->s.size;
 75f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 762:	8b 53 f8             	mov    -0x8(%ebx),%edx
 765:	89 10                	mov    %edx,(%eax)
}
 767:	5b                   	pop    %ebx
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	f3 0f 1e fb          	endbr32 
 774:	55                   	push   %ebp
 775:	89 e5                	mov    %esp,%ebp
 777:	57                   	push   %edi
 778:	56                   	push   %esi
 779:	53                   	push   %ebx
 77a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 780:	8b 3d ac 0b 00 00    	mov    0xbac,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 786:	8d 70 07             	lea    0x7(%eax),%esi
 789:	c1 ee 03             	shr    $0x3,%esi
 78c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 78f:	85 ff                	test   %edi,%edi
 791:	0f 84 a9 00 00 00    	je     840 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 797:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 799:	8b 48 04             	mov    0x4(%eax),%ecx
 79c:	39 f1                	cmp    %esi,%ecx
 79e:	73 6d                	jae    80d <malloc+0x9d>
 7a0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7ab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7ae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 7b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7b8:	eb 17                	jmp    7d1 <malloc+0x61>
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7c2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7c5:	39 f1                	cmp    %esi,%ecx
 7c7:	73 4f                	jae    818 <malloc+0xa8>
 7c9:	8b 3d ac 0b 00 00    	mov    0xbac,%edi
 7cf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d1:	39 c7                	cmp    %eax,%edi
 7d3:	75 eb                	jne    7c0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7d5:	83 ec 0c             	sub    $0xc,%esp
 7d8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7db:	e8 5b fc ff ff       	call   43b <sbrk>
  if(p == (char*)-1)
 7e0:	83 c4 10             	add    $0x10,%esp
 7e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e6:	74 1b                	je     803 <malloc+0x93>
  hp->s.size = nu;
 7e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	83 c0 08             	add    $0x8,%eax
 7f1:	50                   	push   %eax
 7f2:	e8 e9 fe ff ff       	call   6e0 <free>
  return freep;
 7f7:	a1 ac 0b 00 00       	mov    0xbac,%eax
      if((p = morecore(nunits)) == 0)
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	85 c0                	test   %eax,%eax
 801:	75 bd                	jne    7c0 <malloc+0x50>
        return 0;
  }
}
 803:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 806:	31 c0                	xor    %eax,%eax
}
 808:	5b                   	pop    %ebx
 809:	5e                   	pop    %esi
 80a:	5f                   	pop    %edi
 80b:	5d                   	pop    %ebp
 80c:	c3                   	ret    
    if(p->s.size >= nunits){
 80d:	89 c2                	mov    %eax,%edx
 80f:	89 f8                	mov    %edi,%eax
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 818:	39 ce                	cmp    %ecx,%esi
 81a:	74 54                	je     870 <malloc+0x100>
        p->s.size -= nunits;
 81c:	29 f1                	sub    %esi,%ecx
 81e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 821:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 824:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 827:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 82f:	8d 42 08             	lea    0x8(%edx),%eax
}
 832:	5b                   	pop    %ebx
 833:	5e                   	pop    %esi
 834:	5f                   	pop    %edi
 835:	5d                   	pop    %ebp
 836:	c3                   	ret    
 837:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 ac 0b 00 00 b0 	movl   $0xbb0,0xbac
 847:	0b 00 00 
    base.s.size = 0;
 84a:	bf b0 0b 00 00       	mov    $0xbb0,%edi
    base.s.ptr = freep = prevp = &base;
 84f:	c7 05 b0 0b 00 00 b0 	movl   $0xbb0,0xbb0
 856:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 859:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 85b:	c7 05 b4 0b 00 00 00 	movl   $0x0,0xbb4
 862:	00 00 00 
    if(p->s.size >= nunits){
 865:	e9 36 ff ff ff       	jmp    7a0 <malloc+0x30>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 870:	8b 0a                	mov    (%edx),%ecx
 872:	89 08                	mov    %ecx,(%eax)
 874:	eb b1                	jmp    827 <malloc+0xb7>
