// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Certificate.sol";

contract CertificateVerifier {
    Certificate private certificateContract;

    event CertificateVerified(address indexed verifier, address indexed student, bool isValid);

    constructor(address _certificateContractAddress) {
        certificateContract = Certificate(_certificateContractAddress);
    }

    function verifyCertificate(address student) public returns (bool) {
    (string memory studentName, string memory degree, uint256 graduationDate, bool isIssued) = certificateContract.getCertificateDetails(student); // solhint-disable-line unused-local-variable

    // Perform your verification logic here
    bool isValid = isIssued;

    emit CertificateVerified(msg.sender, student, isValid);

    return isValid;
}


}
