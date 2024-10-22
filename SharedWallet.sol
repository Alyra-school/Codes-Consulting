// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SharedWallet {
    address public owner1;
    address public owner2;

    modifier onlyOwners() {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        _;
    }

    constructor(address _owner2) {
        owner1 = msg.sender; // Le déployeur du contrat est le premier propriétaire
        owner2 = _owner2; // Le deuxième propriétaire est passé en paramètre
    }

    // Fonction pour déposer de l'Ether dans le contrat
    function deposit() external payable {}

    // Fonction pour retirer de l'Ether du contrat
    function withdraw(uint _amount) external onlyOwners {
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
    }

    // Fonction pour transférer de l'Ether à un autre compte
    function transfer(address payable _to, uint _amount) external onlyOwners {
        require(address(this).balance >= _amount, "Insufficient balance");
        _to.transfer(_amount);
    }
    
    // Fonction pour consulter le solde du contrat
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
