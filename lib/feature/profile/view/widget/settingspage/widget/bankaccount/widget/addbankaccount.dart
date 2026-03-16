import 'package:flutter/material.dart';

import '../../../../../../../../core/appallvaildation/acaddvaildation.dart';
import '../../../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../../../../model/bankmodel/bankmodel.dart';
import '../backaclist.dart';

class Addbankaccount extends StatefulWidget {
  const Addbankaccount({super.key});

  @override
  State<Addbankaccount> createState() => _AddbankaccountState();
}

class _AddbankaccountState extends State<Addbankaccount> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Add Bank Account"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Commontextformfiled(
                controller: accountHolderController,
                labal: "Account Holder Name",
                hint: "Enter account holder name",
                prefixIcon: Icons.person,
                obscureText: false,
                validator: (value) =>
                    BankAccountValidation.validateName(value ?? ""),
              ),

              const SizedBox(height: 16),

              Commontextformfiled(
                controller: accountNumberController,
                labal: "Account Number",
                hint: "Enter account number",
                Keywordtype: TextInputType.number,
                prefixIcon: Icons.account_balance_wallet,
                obscureText: false,
                validator: (value) =>
                    BankAccountValidation.validateAccountNumber(value ?? ""),
              ),

              const SizedBox(height: 16),

              Commontextformfiled(
                controller: ifscController,
                labal: "IFSC Code",
                hint: "Enter IFSC code",
                prefixIcon: Icons.code,
                obscureText: false,
                validator: (value) =>
                    BankAccountValidation.validateIFSC(value ?? ""),
              ),

              const SizedBox(height: 16),

              Commontextformfiled(
                controller: bankNameController,
                labal: "Bank Name",
                hint: "Enter bank name",
                prefixIcon: Icons.account_balance,
                obscureText: false,
                validator: (value) =>
                    BankAccountValidation.validateBankName(value ?? ""),
              ),

              const SizedBox(height: 16),

              Commontextformfiled(
                controller: branchController,
                labal: "Branch Name",
                hint: "Enter branch name",
                prefixIcon: Icons.location_city,
                obscureText: false,
              ),

              const SizedBox(height: 30),

              CommonButton(
                widht: double.infinity,
                height: 50,
                OnPressed: () {
                  final newBank = BankModel(
                    bankName: bankNameController.text,
                    accountHolderName: accountHolderController.text,
                    accountNumber: accountNumberController.text,
                    ifscCode: ifscController.text,
                    branchName: branchController.text,
                    isPrimary: false,
                  );
                  BankDummyData.bankList.add(newBank);
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bank Account Added Successfully"),
                      ),
                    );
                  }
                },
                child: const Text("Save Bank Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
