var ColoredNumbers = artifacts.require('ColoredNumbers')

module.exports = function (deployer) {
  deployer.deploy(
    ColoredNumbers,
    'https://ipfs.io/ipfs/QmSDn85KDMXBxVry83P9VLjvsuiDVpBaynpRBDzh2TTGgf/',
  )
}
