#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

void save(char res[], int length)
{
    int fd = open("sort_string.txt", O_CREATE | O_RDWR);
    for(int i=0; i<length; i++){
        write(fd, &res[i], 1);
    }
    write(fd, "\n", 1);
    close(fd);
}

char* sort_string(char str[], int length){
    char temp;
    char *ans = malloc(length);
    for(int i=0; i<length; i++){
        for(int j=i+1;j<length;j++){
            if(str[i] > str[j]){ 
                temp = str[i];
                str[i] = str[j];
                str[j] = temp;
             }  
         }   
         ans[i] = str[i];     
    }
    return ans;
}

int main(int argc, char *argv[]){

  int length = strlen(argv[1]);
  char *res = malloc(length);
  
  res = sort_string(argv[1], length);
  save(res, length);
}
