// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Certificate {
    struct AcademicCertificate {
        string studentName;
        string degree;
        uint256 graduationDate;
        bool isIssued;
    }

    mapping(address => AcademicCertificate) public certificates;

    event CertificateIssued(address indexed student, string studentName, string degree, uint256 graduationDate);

    function issueCertificate(
        string memory studentName,
        string memory degree,
        uint256 graduationDate
    ) public {
        require(!certificates[msg.sender].isIssued, "Certificate already issued");

        AcademicCertificate memory newCertificate = AcademicCertificate({
            studentName: studentName,
            degree: degree,
            graduationDate: graduationDate,
            isIssued: true
        });

        certificates[msg.sender] = newCertificate;

        emit CertificateIssued(msg.sender, studentName, degree, graduationDate);
    }

    function getCertificateDetails(address student) public view returns (string memory, string memory, uint256, bool) {
        AcademicCertificate memory certificate = certificates[student];
        return (certificate.studentName, certificate.degree, certificate.graduationDate, certificate.isIssued);
    }
}
