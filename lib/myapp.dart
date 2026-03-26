import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/commonstyle/theme/theme.dart';
import 'feature/auth/loginscreen/loginscreen.dart';
import 'feature/homepage/viewmodel/datauplodeprovider.dart';
import 'feature/orders/viewmodel/orderdataprovider.dart';
import 'feature/profile/view/widget/settingspage/widget/settings/themeprovider.dart';
import 'feature/profile/viewmodel/kycprovider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Orderdataprovider()),
        ChangeNotifierProvider(create: (_) => Datauplodeprovider()),
        ChangeNotifierProvider(create: (_) => Kycprovider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Resell',
            theme: AppTheme.lighttheme,
            darkTheme: AppTheme.darktheme,
            themeMode: themeProvider.themeMode,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
