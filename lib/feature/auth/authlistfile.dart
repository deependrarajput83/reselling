import '../../core/commonfile/commonicon.dart';
import 'authtextfile.dart';

class Authlistfile {
  static const List<Map<String, dynamic>> fields = [
    {
      "fieldName": Authtextfile.nameindicator,
      "icon": Commonicon.personIcon,
      "hintText": Authtextfile.name,
    },
    {
      "fieldName": Authtextfile.emailindicator,
      "icon": Commonicon.emailicon,
      "hintText": Authtextfile.email,
    },
    {
      "fieldName": Authtextfile.Phonenumindicator,
      "icon": Commonicon.mobileicon,
      "hintText": Authtextfile.mobile,
    },
    {
      "fieldName": Authtextfile.passwordindicator,
      "icon": Commonicon.lock,
      "hintText": Authtextfile.createpassword,
    },
  ];
}
