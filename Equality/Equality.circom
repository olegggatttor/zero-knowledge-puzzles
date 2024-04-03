pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
   signal input a[3];
   signal output c;

   signal temp1;
   signal temp2;

   temp1 <-- a[0] - a[1] == 0 ? 1 : 0;
   temp2 <-- a[1] - a[2] == 0 ? 1 : 0;
   c <== temp1 * temp2;
}

component main = Equality();