import 'dart:async';

import 'package:flutter/material.dart';

import 'kycvarificationinformation.dart';

class KycProcessingPage extends StatefulWidget {
  const KycProcessingPage({super.key});
  @override
  State<KycProcessingPage> createState() => _KycProcessingPageState();
}

class _KycProcessingPageState extends State<KycProcessingPage> {
  int seconds = 10;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const Kycvarificationinformation(showMessage: true),
          ),
        );
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text("Verifying your details...", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              "Please wait $seconds sec",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
