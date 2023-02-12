const hre = require('hardhat');
const ethers = hre.ethers;

const path = require('path');

async function main() {
  if (network.name === "hardhat") {
    console.warn(
      "You are trying to deploy a contract to the Hardhat Network, which" +
        "gets automatically created and destroyed every time. Use the Hardhat" +
        " option '--network localhost'"
    );
  }

  const [deployer] = await ethers.getSigners()

  console.log("Deploying with", await deployer.getAddress())

  const tx = await ethers.getContractFactory("stringMethods", deployer)
  const stringMethods = await tx.deploy(
   
  )
  await stringMethods.deployed()
  console.log(stringMethods.address)
  
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  }) 