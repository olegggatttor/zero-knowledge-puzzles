pragma circom 2.1.8;

// Your circuit should constrain the third signal in `in`
// to be the product of the first two signals

template MultiplyNoOutput() {
    signal input in[3];

    in[2] === in[0] * in[1];

}

component main = MultiplyNoOutput();
