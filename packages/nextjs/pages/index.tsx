import Link from "next/link";
import type { NextPage } from "next";
import { BugAntIcon, SparklesIcon } from "@heroicons/react/24/outline";
import { MetaHeader } from "~~/components/MetaHeader";

const Home: NextPage = () => {
  return (
    <>
      <MetaHeader />
      <div className="flex items-center flex-col flex-grow pt-10">
        <div className="px-5">
          <h1 className="text-center mb-8">
            <span className="block text-2xl mb-2">Welcome to</span>
            <span className="block text-4xl font-bold">zkUrnae</span>
          </h1>
          <p className="text-center text-lg">Discover zkUrnae: </p>
          <p className="text-center text-lg">✅ Secure & Private Voting: Your vote, your secret.</p>
          <p className="text-center text-lg">🌐 Transparent Elections: Trust in the process.</p>
          <p className="text-center text-lg">🗳️ Accessible & Convenient: Vote from anywhere, anytime.</p>
          <p className="text-center text-lg">🚀 Cutting-Edge Technology: Powered by Base, our advanced blockchain.</p>
        </div>

        <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
          <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <Link href="/debug" passHref className="link">
                <BugAntIcon href="/debug" className="h-8 w-8 fill-secondary" />
              </Link>{" "}
            </div>
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <Link href="/example-ui" passHref className="link">
                <SparklesIcon href="/example-ui" className="h-8 w-8 fill-secondary" />
              </Link>{" "}
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
