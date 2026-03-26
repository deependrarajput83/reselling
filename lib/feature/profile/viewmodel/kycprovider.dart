import 'package:flutter/material.dart';

class Kycprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> KycData = [];
  final panController = TextEditingController();
  final aadharController = TextEditingController();
  final bankAccountController = TextEditingController();
  Map<String, dynamic> get data => {
    "Pan": panController.text,
    "Aadhar": aadharController.text,
    "BankAccount": bankAccountController.text,
  };
  void addkycdata() {
    KycData.add(data);
    notifyListeners();
    print("Data added successfully");
  }

  void clearControllers() {
    panController.clear();
    aadharController.clear();
    bankAccountController.clear();
    notifyListeners();
  }

  List<KYCModel> getKycModels() {
    return KycData.map((e) {
      return KYCModel.fromJson(e);
    }).toList();
  }

  @override
  void dispose() {
    panController.dispose();
    aadharController.dispose();
    bankAccountController.dispose();
    super.dispose();
  }
}

class KYCModel {
  final String pan;
  final String aadhar;
  final String bankAccount;

  KYCModel({
    required this.pan,
    required this.aadhar,
    required this.bankAccount,
  });
  factory KYCModel.fromJson(Map<String, dynamic> map) {
    return KYCModel(
      pan: map['Pan'] ?? "",
      aadhar: map['Aadhar'] ?? "",
      bankAccount: map['BankAccount'] ?? "",
    );
  }
}
