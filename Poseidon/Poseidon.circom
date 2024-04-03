pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";



// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
   signal input a;
   signal input b;
   signal input c;
   signal input d;
   signal output out;

   component hasher = Poseidon(4);
   
   hasher.inputs[0] <== a;
   hasher.inputs[1] <== b;
   hasher.inputs[2] <== c;
   hasher.inputs[3] <== d;

   hasher.out ==> out;
   // Your Code here.. 
}

component main = poseidon();