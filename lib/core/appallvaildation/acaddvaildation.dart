class BankAccountValidation {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Account holder name is required";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  static String? validateAccountNumber(String value) {
    if (value.isEmpty) {
      return "Account number is required";
    }
    if (value.length < 8) {
      return "Invalid account number";
    }
    return null;
  }

  static String? validateIFSC(String value) {
    if (value.isEmpty) {
      return "IFSC code is required";
    }

    final RegExp ifscRegex = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');

    if (!ifscRegex.hasMatch(value)) {
      return "Invalid IFSC code";
    }

    return null;
  }

  static String? validateBankName(String value) {
    if (value.isEmpty) {
      return "Bank name is required";
    }
    return null;
  }
}
