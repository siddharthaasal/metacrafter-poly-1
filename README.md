# metacrafter-poly-1

In this project I created 5 NFTs using AI Image Generation tools, I uploaded those NFTs on Pinata Cloud.
I deployed, minted and approved that NFT collection on the Ethereum blockchain, mapping the collection to Polygon, and transferring assets via the Polygon Bridge.

# Installing

* Clone this repository.
* Run the following commands.

```cmd
npm i
```
* This will install all the required dependencies and hardhat

* After these dependencies are installed you have to compile the smart contract using hardhat
```cmd
npx hardhat compile
```
* Then you have to run the following commands to deploy the smart contract
```cmd
npx hardhat run scripts/deploy.js --network goerli
```
* This will return an address where the token is deployed on the goerli testnet and you can access that on this link
[goerli testnet](https://goerli.etherscan.io/)
```cmd
npx hardhat run scripts/batchMint.js --network goerli
```
* Change the token address in this file to the one you get and this will mint those NFTs on the address 
```cmd
npx hardhat run scripts/deposit.js --network goerli
```
* Change the token address in this file to the one you got this will deposit and approve those NFTs on the address 
```cmd
npx hardhat run scripts/bridge.js --network mumbai
```
* This will bridge your token with the polygon mumbai and you will be able to see your NFTs on the testnet

# Author
Siddharth Aasal

  
