import 'package:flutter/material.dart';

import '../../../../core/commonstyle/colorstyle.dart';
import '../../../bottomnavbar/bottomnavbar.dart';
import '../../authtextfile.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavbar()),
        );
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: isPressed
                ? [Colors.grey.shade700, Colors.grey.shade900]
                : [AppColor.primary, AppColor.primary],
          ),
          boxShadow: isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            Authtextfile.login,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
