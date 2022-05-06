//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {

    // max number of whitelisted addresses
    uint8 public maxWhitelistedAddresses;

    //mapping of whitelistedAddresses
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted used to track number of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    // setting the max number of whitelisted addresses
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    /*
        addAddressToWhitelist: function adds the address of the sender to the
        whitelist
     */
    function addAddressToWhitelist() public {
        // check if the user has whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses,
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}
