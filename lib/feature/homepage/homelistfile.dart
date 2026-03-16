import '../../core/commonfile/commonicon.dart';
import 'hometextfile.dart';

class Homelistfile {
  ///App Top section Data
  static const List<Map<String, dynamic>> TopSection = [
    {"Icon": Commonicon.itemicon, "title": AppTextFile.TProducts},
    {"Icon": Commonicon.totalSales, "title": AppTextFile.Tsales},
    {
      "Image": "image/svgicon/totalearining.png",
      "title": AppTextFile.TEarnings,
    },
    {"Image": "image/svgicon/bank.png", "title": AppTextFile.Updateac},
  ];

  ///App Stock Section Data
  static const List<Map<String, dynamic>> StockSection = [
    {"Icon": Commonicon.instock, "title": AppTextFile.inStock},
    {"Icon": Commonicon.lowstock, "title": AppTextFile.Lstock},
    {"Image": "image/svgicon/outofstock.png", "title": AppTextFile.OutStock},
    {"Image": "image/svgicon/lock.png", "title": AppTextFile.Lock},
  ];

  ///App Quick Section Data
  static const List<Map<String, dynamic>> AppQuick = [
    {"Image": "image/svgicon/addproduct.png", "title": AppTextFile.AP},
    {"Icon": Commonicon.eyeicon, "title": AppTextFile.Vo},
    {"Image": "image/svgicon/share.png", "title": AppTextFile.SCatalog},
  ];

  ///Total Earnings section Data
  static const List<Map<String, dynamic>> TEarnings = [
    {"Icon": Commonicon.moneyicon, "title": AppTextFile.TEarnings},
    {"Icon": Commonicon.ShopingCart, "title": AppTextFile.TotalOrders},
    {"Icon": Commonicon.totalSales, "title": AppTextFile.AvgOrdValue},
    {"Icon": Commonicon.Refunds, "title": AppTextFile.Refund},
  ];
}
