pragma circom 2.1.8;

// Create constraints that enforces all signals
// in `in` are binary, i.e. 0 or 1.

template AllBinary(n) {
    signal input in[n];

    for (var i = 0; i < n; i++) {
        in[i] * (1 - in[i]) === 0;
    }

}

component main = AllBinary(4);
