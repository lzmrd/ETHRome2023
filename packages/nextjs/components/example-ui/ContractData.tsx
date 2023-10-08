import { MintButton } from "./MintButton";
import { SendCommitHashBox } from "./SendCommitHashBox";

export const ContractData = () => {
  return (
    <div className="flex flex-col justify-center items-center bg-[url('/assets/gradient-bg.png')] bg-[length:100%_100%] py-10 px-5 sm:px-0 lg:py-auto max-w-[100vw] ">
      <div className="flex flex-col mt-6 px-7 py-8 bg-base-200 opacity-80 rounded-2xl shadow-lg border-2 border-primary">
        <MintButton />
      </div>
      <SendCommitHashBox />
    </div>
  );
};
