import 'package:flutter/material.dart';
import 'package:reselling_new/feature/profile/view/widget/profileinfo.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/settingamainpage.dart';
import 'package:reselling_new/feature/profile/view/widget/storeinfo.dart';

import '../../../core/commonfile/screensize.dart';
import '../../../core/commonfile/shimmereffact.dart';
import '../../../core/commonwidget/commonappbar.dart';

class ProfileMainPage extends StatefulWidget {
  final IsactiveProfilePage;
  const ProfileMainPage({super.key, required this.IsactiveProfilePage});
  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  bool IsLoding = false;
  @override
  void didUpdateWidget(ProfileMainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.IsactiveProfilePage && !oldWidget.IsactiveProfilePage) {
      startLoadingprofile();
    }
  }

  void startLoadingprofile() {
    setState(() {
      IsLoding = true;
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        IsLoding = false;
      });
    });
  }

  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      startLoadingprofile();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: false, title: "Profile"),
      body: IsLoding
          ? shimmerItem()
          : Column(
              children: [
                ProfileInfo(),
                SizedBox(height: Screensize.height(context) * 0.01),
                StoreInfo(),
                SizedBox(height: Screensize.height(context) * 0.01),
                SettingAllInfo(),
              ],
            ),
    );
  }
}
