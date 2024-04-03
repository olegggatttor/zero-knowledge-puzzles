pragma circom 2.1.8;

// Create a circuit that takes an array of signals `in` and
// returns 1 if all of the signals are 1. If any of the
// signals are 0 return 0. If any of the signals are not
// 0 or 1 the circuit should not be satisfiable.

template MultiAND(n) {
    signal input in[n];
    signal output out;

    signal carry[n + 1];

    carry[0] <== 1;
    var res = 1;
    for (var i = 1; i < n + 1; i++) {
        in[i - 1] * (1 - in[i - 1]) === 0;
        carry[i] <== carry[i - 1] * in[i - 1];
    }

    carry[n] ==> out;
}

component main = MultiAND(4);
