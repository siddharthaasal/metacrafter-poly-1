const hre = require("hardhat");

async function main() {
  const MyNFT = await hre.ethers.getContractFactory("MyNFT"); // Corrected function name
  const token = await MyNFT.deploy(); // Deploy the contract
  await token.deployed(); // Wait for the deployment to complete
  console.log("Token address is:", token.address); // Access the address directly
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
