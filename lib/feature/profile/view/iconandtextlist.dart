import '../../../core/commonfile/commonicon.dart';
import '../../homepage/hometextfile.dart';

class Iconandtextlist {
  static const List<Map<String, dynamic>> _profiledata = [
    {
      "icon": Commonicon.KYCSec,
      "text": AppTextFile.KycVari,
      "IconTwo": Commonicon.Arrowforward,
    },
    {
      "icon": Commonicon.BankAc,
      "text": AppTextFile.BankAccount,
      "IconTwo": Commonicon.Arrowforward,
    },
    {
      "icon": Commonicon.settings,
      "text": AppTextFile.Settings,
      "IconTwo": Commonicon.Arrowforward,
    },
    {
      "icon": Commonicon.HelpndSupp,
      "text": AppTextFile.HelpndSupp,
      "IconTwo": Commonicon.Arrowforward,
    },
  ];
  static List<Map<String, dynamic>> get Profiledata => _profiledata;
  static const List<Map<String, dynamic>> kycDataList = [
    {"iconfirst": Commonicon.Clickicon, "KycVerified": AppTextFile.Kycveri},
    {
      "iconfirst": Commonicon.Pancard,
      "docoinfo": AppTextFile.Pan,
      "Iconsecond": Commonicon.Clickicon,
      "Account": "PAN:",
      "Status": "verified",
    },
    {
      "iconfirst": Commonicon.AadharCard,
      "docoinfo": AppTextFile.Aadhar,
      "Iconsecond": Commonicon.Clickicon,
      "Account": "Aadhar:",
      "Status": "verified",
    },
    {
      "iconfirst": Commonicon.BankAccount,
      "docoinfo": AppTextFile.BankAccount,
      "Iconsecond": Commonicon.Clickicon,
      "Account": "Account:",
      "Status": "verified",
    },
    {
      "Title": AppTextFile.Warning,
      "Fulldetails":
          "KYC verification is mandatory to comply with financial regulations and to ensure secure transactions. it helps us protect your account and prevent fraud. ",
    },
  ];
}
