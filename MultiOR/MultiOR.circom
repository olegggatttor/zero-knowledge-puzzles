pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Write a circuit that returns true when at least one
// element is 1. It should return false if all elements
// are 0. It should be unsatisfiable if any of the inputs
// are not 0 or not 1.
template HasAtLeastOne(n) {
    signal input in[n];
    signal input k;
    signal output out;

    signal carry[n + 1];

    carry[0] <== 1;
    for (var i = 1; i < n + 1; i++) {
        carry[i] <== carry[i - 1] * (in[i - 1] - k);
    }

    component res = IsZero();
    res.in <== carry[n];
    res.out ==> out;

}

template MultiOR(n) {
    signal input in[n];
    signal output out;


    for (var i = 0; i < n; i++) {
        in[i] * (1 - in[i]) === 0;
    }
    component checker = HasAtLeastOne(n);
    checker.in <== in;
    checker.k <== 1;

    checker.out ==> out;

}

component main = MultiOR(4);
