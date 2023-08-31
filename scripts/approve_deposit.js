const hre = require("hardhat");
const fxRootContractABI = require("../fxRootContractABI.json");
const tokenContractJSON = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");

const tokenAddress = "0xb3C0B6200Bf22025E2433718Ee98a3607b80451E";
const tokenABI = tokenContractJSON.abi;
const fxERC721RootAddress = "0xDB2cE9Ad2F4042903878a3eC9D9bD1753620cD29";
const walletAddress = "0xBf2ED3390Dad2468A09b24225003add5792af80d";

async function main() 
{
  const tokenContract = await hre.ethers.getContractAt(tokenABI, tokenAddress);
  const fxContract = await hre.ethers.getContractAt(fxRootContractABI, fxERC721RootAddress);
  const totalSupply = await tokenContract.totalSupply();

  for (let i = 0; i < totalSupply; i++) 
  {
    const tokenId = await tokenContract.tokenByIndex(i);
    const approveTx = await tokenContract.approve(fxERC721RootAddress, tokenId);
    await approveTx.wait();
    console.log('Approved');
    const depositTx = await fxContract.deposit(tokenAddress, walletAddress, tokenId, "0x6556");
    await depositTx.wait();
    console.log("NFT transacted");
  }
}

main().catch((error) => 
{
  console.error(error);
  process.exitCode = 1;
}
);