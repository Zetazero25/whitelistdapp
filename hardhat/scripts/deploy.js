const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is used to deploy new smart contracts
  whitelistContract is factory for instances of the Whitelist contract
  */
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  //deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the max number of whitelisted addresses
  
  // Wait to finish deploying
  await deployedWhitelistContract.deployed();

  // print address of deployed contract
  console.log(
    "Whitelist Contract Address:",
    deployedWhitelistContract.address
  );
}

// call the main function/check errors
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });