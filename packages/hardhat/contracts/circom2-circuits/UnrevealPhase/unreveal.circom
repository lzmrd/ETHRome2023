pragma circom 2.0.0;

include "../circomlib/circuits/poseidon.circom";

template UnrevealVoteData() { 
    signal input NullifierHash;
    signal input voteDataIn;
    signal input nullifierIn;
    signal output voteDataOut <== voteDataIn;
    signal output NullifierHashOut <== NullifierHash;
    
    component hashNullifier = Poseidon(1);
    hashNullifier.inputs[0] <== nullifierIn + voteDataIn;
    hashNullifier.out === NullifierHash;
   
}


component main = UnrevealVoteData();