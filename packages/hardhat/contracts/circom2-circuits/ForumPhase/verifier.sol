// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 17537710988332925479969969537351045788450320091337464811271688460999023418864;
    uint256 constant alphay  = 13153190947041661849119855012535743128265569246327991330702228092757288043897;
    uint256 constant betax1  = 3006231882326853289622636586723649917717282875232331304998417354217040661880;
    uint256 constant betax2  = 20038338359020259868179112569937663887657599862972505260811488141363985305976;
    uint256 constant betay1  = 17554739356199124976736145073178038069293261597723398994416478482585595661518;
    uint256 constant betay2  = 21040550184686329356766834224741365188864514704184046811382423704843886086150;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 18960082643251112375843986028344701005119437206474321556781428610913313566665;
    uint256 constant deltax2 = 10273861141160686591993044025641845041171539546250328577803721959087361666735;
    uint256 constant deltay1 = 13481758106001391494954062686639504552036319148455170387022959664337885094527;
    uint256 constant deltay2 = 11569395006748199750960524434981894298687243424321227328022893668707049506372;

    
    uint256 constant IC0x = 11567561012112114443716326399937615487281219454818175728089071589969601383728;
    uint256 constant IC0y = 8759630016531681982149384044925873340450428883778693024275693538088329219198;
    
    uint256 constant IC1x = 9149885066367352371483990818373666502617720466227819193890426109484317905387;
    uint256 constant IC1y = 18702723416608869740662706985414698252020260284176062211155947207457077141123;
    
    uint256 constant IC2x = 2933564380924938883799811226767878838021598193306416865458157530044263641817;
    uint256 constant IC2y = 20459225854811312545128071276906647578093094539485755876081473523437752334021;
    
    uint256 constant IC3x = 19153459415480128252061228995488701975046058456138601367456834360649085888653;
    uint256 constant IC3y = 12668512181505688560568839584916419658849265923685586616418319208966548644765;
    
    uint256 constant IC4x = 20926512596504606850371036029820675863471390140518716351112582626276844022455;
    uint256 constant IC4y = 4406769895257353267282788139131417273987896323837944991113424768239135801514;
    
    uint256 constant IC5x = 12407589239932758545172737463573047123166615189540176850772926992179674954388;
    uint256 constant IC5y = 8479568248366845841465262882004523974020952963145671960348018733169626434239;
    
    uint256 constant IC6x = 17352967698762966324431095248181991245513026872395822453001940856774138285144;
    uint256 constant IC6y = 16127346603816102990888638943391975334958933595520783101225579262204853411105;
    
    uint256 constant IC7x = 15018931996972605531080282928209291984657932481595120568838374859121111906606;
    uint256 constant IC7y = 14564755456412845783539740794128399337027673393070727006472150620838690486482;
    
    uint256 constant IC8x = 7941513448739009623066324911095974537719524591987404637018569452422878928873;
    uint256 constant IC8y = 6059888935185423369678095823513649012946492752204286886277159039404588210171;
    
    uint256 constant IC9x = 6044786902083044132617563839577989853114224872991080878847515956311943011746;
    uint256 constant IC9y = 9257728659350461420926381113551330776077822795558099680833798546550117349682;
    
    uint256 constant IC10x = 6728076938209983210699191508171720272842757384039903962231637020041714396549;
    uint256 constant IC10y = 3309888156030855568028198951892141227743760714354037458643866494792943144566;
    
    uint256 constant IC11x = 3712527473789579344892394740028095400077916884666271958573081540405632961384;
    uint256 constant IC11y = 17605735854932826977608664147576667396423541263853737896246228565863856162301;
    
    uint256 constant IC12x = 1442288241855791034723530945163287372535702018964893650906145101881831117571;
    uint256 constant IC12y = 5334970379440824771801320284289255309928344667072573379181426579742776217449;
    
    uint256 constant IC13x = 165832703487262565806984235980040433640244617806693155369585784014444297225;
    uint256 constant IC13y = 1671625636560097135781996929101852115103433689806794192749016556410931267698;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[13] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
