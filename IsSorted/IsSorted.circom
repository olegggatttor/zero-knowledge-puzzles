pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Write a circuit that constrains the 4 input signals to be
// sorted. Sorted means the values are non decreasing starting
// at index 0. The circuit should not have an output.

template CheckLE() {
    signal input in[2];
    signal temp;

    temp <-- in[0] <= in[1] ? 1 : 0;
    1 === temp;
}
template IsSorted() {
    signal input in[4];

    component l0 = CheckLE();
    l0.in[0] <== in[0];
    l0.in[1] <== in[1];
    component l1 = CheckLE();
    l1.in[0] <== in[1];
    l1.in[1] <== in[2];
    component l2 = CheckLE();
    l2.in[0] <== in[2];
    l2.in[1] <== in[3];
}

component main = IsSorted();
