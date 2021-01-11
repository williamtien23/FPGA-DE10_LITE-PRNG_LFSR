#include <stdio.h>

int binary [8] = {1,0,1,1,0,1,0,1};
int temp;
int decimal;
int main()
{
    printf("Starting at: 181\n");
    
    for (int b=1; b<258; b++)
    {
        decimal=0;
        temp =  binary[3] ^ binary [4] ^ binary [5] ^ binary [7];
        
        for(int a=7; a>0; a--)
        {
            binary[a] = binary[a-1];
        }
        
        binary[0] = temp;
        
        for(int a=0; a<8; a++)
        {
            decimal += binary[7-a]<<a;
        }
        printf("Iteration %d: %d \n", b, decimal);
    }
    return 0;
}