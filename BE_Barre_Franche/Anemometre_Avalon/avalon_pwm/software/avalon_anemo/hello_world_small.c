#include "stdio.h"
#include "system.h"

#define continu (unsigned int *) ANEMO_0_BASE
#define data (unsigned int *) (ANEMO_0_BASE + 4)

int main()
{ 
  printf("This is the Avalon version of the Anemometre!\n");
  *continu = 0x2;

  while (1){
	  int anemo_data = *data;
	  printf("%d \n", anemo_data & 0xFF);
  }

  return 0;
}
