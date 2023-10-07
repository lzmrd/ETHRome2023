import { ArrowSmallRightIcon } from "@heroicons/react/24/outline";
import { useScaffoldContractWrite } from "~~/hooks/scaffold-eth";

export const MintButton = () => {
  const { writeAsync, isLoading } = useScaffoldContractWrite({
    contractName: "VotingSystem",
    functionName: "mint",
    onBlockConfirmation: txnReceipt => {
      console.log("📦 Transaction blockHash", txnReceipt.blockHash, "\n NFT Minted!!");
    },
  });

  return (
    <button
      className="btn btn-primary rounded-full capitalize font-normal font-white w-24 flex items-center gap-1 hover:gap-2 transition-all tracking-widest"
      onClick={() => writeAsync()}
      disabled={isLoading}
    >
      {isLoading ? (
        <span className="loading loading-spinner loading-sm"></span>
      ) : (
        <>
          Mint <ArrowSmallRightIcon className="w-3 h-3 mt-0.5" />
        </>
      )}
    </button>
  );
};
