import '../../../../../../../model/bankmodel/bankmodel.dart';

class BankDummyData {
  static List<BankModel> bankList = [
    BankModel(
      bankName: "ICICI Bank",
      accountHolderName: "Deependra Singh",
      accountNumber: "123456789012",
      ifscCode: "ICIC0001234",
      branchName: "Jaipur Main Branch",
      isPrimary: true,
    ),

    BankModel(
      bankName: "HDFC Bank",
      accountHolderName: "Deependra Singh",
      accountNumber: "987654321098",
      ifscCode: "HDFC0005678",
      branchName: "Delhi Branch",
    ),
    BankModel(
      bankName: "HDFC Bank",
      accountHolderName: "Deependra Singh",
      accountNumber: "987654321098",
      ifscCode: "HDFC0005678",
      branchName: "Delhi Branch",
    ),

    BankModel(
      bankName: "SBI Bank",
      accountHolderName: "Deependra Singh",
      accountNumber: "456789123456",
      ifscCode: "SBIN0004321",
      branchName: "Mumbai Branch",
    ),
  ];
}
