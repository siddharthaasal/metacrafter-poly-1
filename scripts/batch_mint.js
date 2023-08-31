const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");
require('dotenv').config()

const tokenAddress = "0xb3C0B6200Bf22025E2433718Ee98a3607b80451E"; 
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0xBf2ED3390Dad2468A09b24225003add5792af80d"; 

async function main() 
{
  const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);
  const tx = await token.mintNFT(5);
  await tx.wait();
  const newTotalSupply = await token.totalSupply();
  console.log(`Total supply after minting: ${newTotalSupply.toString()}`);
}


main().catch((error) => 
{
console.error(error);
process.exitCode = 1;
}
);