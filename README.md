# zkUrnae

We decided to build a voting protocol that implements zk-SNARKs in order to mantain the privacy of DAO's members.

## Goals 

The project is an exploration of a privacy voting system trough the use of zk-SNARKs.
The goals are mainly 2:<br/>
  -Break the relation between a voter and vote behind a relayer. <br/>
  -Keep the votes unrevealed until the term of the proposal, while not compromising privacy once the vote is revealed.

## Voter perspective

An user that is eligibile for a vote can pick up a private input to compute an hash and recreate commit-reveal pattern.
Once he has a public hashed value he can then create a commit to the contract and use that hash to produce a zk-proof.
From now on the user can create a zk verification calldata to have an onchain verify the proof is valid.
He then can trustlessy delegate the execution to a relayer to avoid disclosing a relation between his address and the data used to make a verification. During the stage, no vote is revealed in order to not make the vote a trend.
In a second phase another zk-proof proving contract can leverege the same relayer mechanic to disclose the vote as it is embedded in the output of the proof, while nullifying the rest of the output to be produced to double spend your vote reiterating the use of the proof. 

## How to use it

To use our protocol, you have to clone the repository and you should run:

 `  yarn install ` 

Once you installed all the dependencies, you can run:

 `  yarn start ` 

This will start your local server at localhost:3000. In this way you can interact through the frontend with the smart contract deployed on Base Goerli.




 

