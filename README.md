# cpe315-lab3
Lab 3 Starter Code

To build, simply type 'make'

Shosei Anegawa, James Rounthwaite

State of the Lab


//Negative numbers in the second operand only work for subt
//if we rearrange the code so that subt is before addi
//And the same is for add if we rearrange the code so that 
//addi is before subt in main.s 
//And the same is for mult, etc. 

//We believe this is because of how scanf works and %d, but
//addi, subt, mult on their own *work as intended* with negative numbers
//They each have code to handle negative values but main doens't interact with them very well. 

//Also putting a negative in the second operand causes the program to not loop
//we believe for the same reasons above. 

//So trying swapping the operands if one of them is negative and you'll see your desired result
