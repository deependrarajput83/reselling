class BankModel {
  final String bankName;
  final String accountHolderName;
  final String accountNumber;
  final String ifscCode;
  final String branchName;
  final bool isPrimary;

  BankModel({
    required this.bankName,
    required this.accountHolderName,
    required this.accountNumber,
    required this.ifscCode,
    required this.branchName,
    this.isPrimary = false,
  });
}
