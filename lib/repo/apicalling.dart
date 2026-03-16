import '../model/productmodel/userproductmodel.dart';
import '../service/apiservice/productdata.dart';

class Productrepo {
  static List<UserProductModel> getproduct() {
    return ProductData.electric
        .map((e) => UserProductModel.fromJson(e))
        .toList();
  }
}
