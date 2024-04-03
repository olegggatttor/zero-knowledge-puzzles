pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Create a circuit that takes an array of signals `in[n]` and
// a signal k. The circuit should return 1 if `k` is in the list
// and 0 otherwise. This circuit should work for an arbitrary
// length of `in`.

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

component main = HasAtLeastOne(4);
