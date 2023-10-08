pragma circom 2.0.0;

include "../circomlib/circuits/poseidon.circom";

template Forum() { 
    var counterparts = 10;
    signal input providedHash;
    signal input voteData;
    signal input secret;
    signal input nullifierIn;
    signal input counterpartsIn[counterparts];
    signal output counterpartsChunkSumOut;
    signal output nullifierOut;
    signal output matchOut;
    signal output counterpartsOut[counterparts] <== counterpartsIn;

    component hashNullifier = Poseidon(1);
    hashNullifier.inputs[0] <== nullifierIn + voteData;
    hashNullifier.out ==> nullifierOut;
    
    component hashSecret = Poseidon(1);
    hashSecret.inputs[0] <== secret + nullifierOut;
    hashSecret.out === providedHash;
    var hashSec = hashSecret.out;
    var provHash = providedHash;

    var match;
    var counterpartSum;
    for (var i = 0; i < counterparts; i++){
        counterpartSum += counterpartsIn[i] / 1000;
            if (provHash == hashSec) {
               match = 1;
            }
    }
    counterpartsChunkSumOut <-- counterpartSum;
    matchOut <-- match;
}


component main = Forum();