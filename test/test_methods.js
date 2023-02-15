const { expect } = require("chai")
const { ethers } = require("hardhat")


describe("stringMethods", function(){
    let owner 
    let buyer 
    let Token


    beforeEach(async function(){
        [owner, buyer] = await ethers.getSigners()

        const tx = await ethers.getContractFactory("stringMethods", owner)
        str = await tx.deploy()
        await str.deployed()

        
    })

    it("should mint convert str to int", async function(){
    
      expect(await str.str2uint("2451")).to.eq(2451);
    })
    it("should mint convert int to str", async function(){
    
      expect(await str.uint2str(2451)).to.eq("2451");
    })
    it("should mint convert int to str", async function(){
    
      expect(await str.eq("2515", "2515")).to.eq(true);
      expect(await str.eq("251", "2515")).to.eq(false);
    })
    it("should convert str1 to str2 with iteral ", async function(){
    
      expect(await str.findIter("My little pony", [4,2,10,12,1])).to.eq("i pny");
     
    })
    it("shoul sum str1 and str2", async function(){
      const tx = await str.sum("hello ", "world");
      console.log(tx);
      expect(await str.sum("hello ", "world")).to.eq("hello world");
     
    })
    it("should split string ", async function(){
      const tx = await str.split("ZUXUZUZUXUZUXUZUDXUZUXUZXUZUXUZUXUZXUZUXUXZUXUXZUZXUXUZUXZUZXUUUZXUXZUXUZXUXZUZXUXUZXUZX", "XUZ");
      
      console.log(tx);
      
    })
    it("should be sort string ", async function(){
      const tx = await str.sort("BCDA");
      
      console.log(tx);
      
    })
    it("should be find len string ", async function(){
      const tx = await str.len("Hello world!");
      
      console.log(tx);
      
    })
})


