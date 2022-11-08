// var Event = artifacts.require("../contracts/Event.sol"); 
// // import  "../contracts/Event.sol";

// module.exports = function deployer(){
//     deployer.deploy(Event);
// }
var Event = artifacts.require("Event");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(Event);
};
