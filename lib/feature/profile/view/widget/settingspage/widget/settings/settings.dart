import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/settings/themeprovider.dart';

import '../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkMode = false;
  bool pushNotification = true;

  final List<String> notificationtext = [
    "Order Updates",
    "Low Stock Alerts",
    "Payment Notification",
    "Delivery Updates",
  ];

  final List<bool> notificationValue = [true, true, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(showBack: true, title: "Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _sectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(context, "Appearance"),
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return _switchRow(
                        context,
                        icon: Icons.wb_sunny,
                        text: "Dark Mode",
                        value: themeProvider.isDark,
                        onChanged: (v) {
                          themeProvider.toggleTheme(v);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: Screensize.height(context) * 0.02),
            _sectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(context, "Notification"),

                  _switchRow(
                    context,
                    icon: Commonicon.notification,
                    text: "Push Notifications",
                    value: pushNotification,
                    onChanged: (v) => setState(() => pushNotification = v),
                  ),

                  ListView.builder(
                    itemCount: notificationtext.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: Checkbox(
                              value: notificationValue[index],
                              onChanged: (v) {
                                setState(() {
                                  notificationValue[index] = v!;
                                });
                              },
                            ),
                          ),
                          Text(
                            notificationtext[index],
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: Screensize.height(context) * 0.02),
            _sectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Commonicon.KYCSec),
                      SizedBox(width: Screensize.height(context) * 0.008),
                      Text(
                        "Security",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Password",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Settings",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: Screensize.height(context) * 0.02),
            _sectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CommonContainer(
                        radius: 50,
                        height: Screensize.height(context) * 0.025,
                        width: Screensize.weight(context) * 0.05,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        child: Icon(Commonicon.lowstock, size: 17),
                      ),
                      SizedBox(width: Screensize.height(context) * 0.008),
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),

                  SizedBox(height: Screensize.height(context) * 0.01),

                  _infoRow(context, "App Version", "1.0.0"),
                  _infoRow(context, "Build", "2025.12.10"),

                  SizedBox(height: Screensize.height(context) * 0.015),
                  const Divider(thickness: 0.3),

                  TextButton(
                    onPressed: () {},
                    child: const Text("Terms of Service"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Privacy Policy"),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Licenses")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionContainer(BuildContext context, {required Widget child}) {
    return CommonContainer(
      padding: EdgeInsets.all(AppSize.paddingSm),
      width: double.infinity,
      color: Colors.white,
      child: child,
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _switchRow(
    BuildContext context, {
    required dynamic icon,
    required String text,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: Screensize.height(context) * 0.008),
        Text(text, style: Theme.of(context).textTheme.titleSmall),
        const Spacer(),
        Transform.scale(
          scale: 0.8,
          child: Switch(value: value, onChanged: onChanged),
        ),
      ],
    );
  }

  Widget _infoRow(BuildContext context, String title, String value) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        const Spacer(),
        Text(value, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
