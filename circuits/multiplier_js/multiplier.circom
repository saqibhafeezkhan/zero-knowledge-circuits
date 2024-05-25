pragma circom 2.1.9;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  
   signal output c;  

   // Constraints.  
   c <== a * b;  
}

template Multiplier3 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b; 
   signal input c;
   signal output d; 
   signal inter;
   inter <== a*b;
   d <== inter*c;
}

component main{public[a,b]} = Multiplier2();