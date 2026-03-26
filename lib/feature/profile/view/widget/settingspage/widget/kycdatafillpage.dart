import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/core/commonfile/app.dart';
import 'package:reselling_new/core/commonwidget/commontextformfiled.dart';

import '../../../../viewmodel/kycprovider.dart';
import 'kycprocessingpoint.dart';

class Kycdatafillpage extends StatelessWidget {
  const Kycdatafillpage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Kycprovider>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CommonAppBar(showBack: false, title: "KYC Verification"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Complete Your KYC",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "Please fill your details carefully",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.grey.shade300,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Commontextformfiled(
                        controller: provider.panController,
                        obscureText: false,
                        hint: "Enter PAN Number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter PAN";
                          }
                          if (value.length != 10) {
                            return "PAN must be 10 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Commontextformfiled(
                        controller: provider.aadharController,
                        obscureText: false,
                        Keywordtype: TextInputType.number,
                        hint: "Enter Aadhar Number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Aadhar";
                          }
                          if (value.length != 12) {
                            return "Aadhar must be 12 digits";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Commontextformfiled(
                        controller: provider.bankAccountController,
                        obscureText: false,
                        Keywordtype: TextInputType.number,
                        hint: "Enter Bank Account Number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Bank Account";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    OnPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        provider.addkycdata();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const KycProcessingPage(),
                          ),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
