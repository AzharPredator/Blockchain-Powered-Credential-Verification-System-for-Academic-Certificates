// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Certificate {
    struct AcademicCertificate {

//unit256 folio no;//
        string nameOfCandidate;
        unit256 folioNo;
        unit256 registerNo;
        string memory dateOfBirth;
        string gender;
        string month&YearOfExamination;
        string dateOfPublication;
        string programme&Branch;
        string bTechInformationTechnology;
        string regulation;
        uint256 semNo;
        string courseCode;
        string attCode;
        string letterGrade;
        unit256 gradePoint;
        string courseTitle;
        uint256 credits;
        string result;
        string semester;
        unit256 creditsRegistered;
        unit256 creditsEarned;

        string degree;
        uint256 graduationDate;
        bool isIssued;
    }

    mapping(address => AcademicCertificate) public certificates;

    event CertificateIssued(address indexed student, string nameOfCandidate, unit256 folioNo, unit256 registerNo,
     string memory dateOfBirth, string gender, string month&YearOfExamination, string dateOfPublication, string programme&Branch,
      string bTechInformationTechnology, string regulation, uint256 semNo, string courseCode, string attCode, string letterGrade, unit256 gradePoint,
       string courseTitle, uint256 credits, string result, string semester, unit256 creditsEarned,

     string degree, uint256 graduationDate);

    function issueCertificate(
        string memory nameOfCandidate,
        unit256 folioNo,
        unit256 registerNo,
        string memory dateOfBirth,
        string gender,
        string month&YearOfExamination,
        string dateOfPublication,
        string programme&Branch,
        string bTechInformationTechnology,
        string regulation,
        uint256 semNo,
        string courseCode,
        string attCode,
        string letterGrade,
        unit256 gradePoint,
        string courseTitle,
        uint256 credits,
        string result,
        string semester,
        unit256 creditsRegistered,
        unit256 creditsEarned,

        string memory degree,
        uint256 graduationDate
    ) public {
        require(!certificates[msg.sender].isIssued, "Certificate already issued");

        AcademicCertificate memory newCertificate = AcademicCertificate({
            nameOfCandidate: nameOfCandidate,
            folioNo: folioNo,
            registerNo: registerNo,
            dateOfBirth: dateOfBirth,
            gender: gender,
            month&YearOfExamination: month&YearOfExamination,
            dateOfPublication: dateOfPublication,
            programme&Branch: programme&Branch,
            bTechInformationTechnology: bTechInformationTechnology,
            regulation: regulation,
            semNo: semNo,
            courseCode: courseCode,
            attCode: attCode,
            letterGrade: letterGrade,
            gradePoint: gradePoint,
            courseTitle: courseTitle,
            credits: credits,
            result: result,
            semester: semester,
            creditsRegistered: creditsRegistered,
            creditsEarned: creditsEarned,

            degree: degree,
            graduationDate: graduationDate,
            isIssued: true
        });

        certificates[msg.sender] = newCertificate;

        emit CertificateIssued(msg.sender, nameOfCandidate, folioNo, registerNo, dateOfBirth, gender, month&YearOfExamination, dateOfPublication,
         programme&Branch, bTechInformationTechnology, regulation, semNo, courseCode, attCode, letterGrade, gradePoint, courseTitle, credits,
          result, semester, creditsRegistered, creditsEarned,

         degree, graduationDate);
    }

    function getCertificateDetails(address student) public view returns (string memory, uint256, uint256,
     string memory, string memory, string memory, string memory, string memory, string memory, string memory, uint256, string memory, string memory,
      string memory, uint256, string memory, uint256, string memory, string memory, uint256, uint256,

     string memory, uint256, bool) {
        AcademicCertificate memory certificate = certificates[student];
        return (certificate.nameOfCandidate, certificate.folioNo, certificate.registerNo, certificate.dateOfBirth,
         certificate.gender, certificate.month&YearOfExamination, certificate.dateOfPublication, certificate.programme&Branch, 
         certificate.bTechInformationTechnology, certificate.regulation, certificate.semNo, certificate.courseCode, certificate.attCode, 
         certificate.letterGrade, certificate.gradePoint, certificate.courseTitle, certificate.credits, certificate.result, certificate.semester,
          certificate.creditsRegistered, certificate.creditsEarned,
         
         certificate.degree, certificate.graduationDate, certificate.isIssued);
    }
}