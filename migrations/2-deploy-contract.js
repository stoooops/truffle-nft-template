var MyNFT = artifacts.require("MyNFT");

module.exports = function(deployer) {
  deployer.deploy(MyNFT, "https://ipfs.io/ipfs/foo/");
};
