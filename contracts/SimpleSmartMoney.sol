// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleSmartMoneySmart {
    /**
    - The `totalBalanceRecieved` is a public state variable of type uint256, 
    - representing the total amount in wei (the smallest unit of ether) that 
    - has been deposited into this contract by users.
    **/
    uint256 public totalBalanceRecieved;

    /** 
    - Function `deposit()`: 
    - This function allows any user to deposit Ether into the smart contract. 
    - It is marked as payable, which means it can receive Ether along with 
    - other data in its transaction. 
    - The value of the incoming Ether is added to the `totalBalanceRecieved` variable.
    -  When called, this function will increment the sender's balance by the amount
    -  they are sending (msg.value).
    **/

    function deposit() public payable {
        totalBalanceRecieved += msg.value;
    }

    /**
     -  Function `withdrawAllToSenderAddress()`: 
     - This function allows a user to withdraw all of their Ether from the contract 
     - back into their own account. The total amount available for withdrawal
     -  is determined by calling the `getContractBalance()` function (which returns 
     - the balance of this smart contract). The `transfer` method is used here, which 
     - sends the specified amount of wei to a given address and automatically handles
     -  gas fees. In this case, it's sent back to the sender.
     **/
    function withdrawAllToSenderAddress() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    /**
    - Function `withrawToAdress(address payable  to)`: 
    - This function allows an owner (not shown here because there are no roles defined for
    - these functions) to withdraw all of the Ether from the contract into a specified 
    - address. The recipient's address must be provided when calling this function and
    - it is marked as `payable`, allowing ether to be sent directly to that address.
    **/
    function withrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }

    /** 
    - Function `getContractBalance()`: 
    - This view function simply returns the current balance of the contract in wei.
    - It does so by using the built-in `address(this).balance` property which always
    - refers to the current contract's balance. The returned value is of type uint256,
    - representing the amount of Ether in the contract, in smallest denomination (wei).
    **/
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
