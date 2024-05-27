pragma circom 2.1.9;
include "../../node_modules/circomlib/circuits/comparators.circom";
/*This circuit template checks that if age is above ageLimit.*/  

template ageCheck(){
    signal input age;  //private
    signal input ageLimit;  // public - set by verifier
    signal output isAgeAboveLimit;  // 

    component greaterThan = GreaterEqThan(7); // 7 bit number because 2^7 = 128
    
    greaterThan.in[0] <== age;
    greaterThan.in[1] <== ageLimit;
    isAgeAboveLimit <== greaterThan.out;

}

component main{public [ageLimit]} = ageCheck();