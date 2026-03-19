import 'dart:io';

import 'package:flutter/material.dart';

import '../../../model/productmodel/userproductmodel.dart';

class Datauplodeprovider extends ChangeNotifier {
  List<Map<String, dynamic>> productdata = [];
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final stockcontroller = TextEditingController();
  final categorycontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final tagscontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final mrpcontroller = TextEditingController();
  List<File> selectedImages = [];
  Map<String, dynamic> get tempdata => {
    "Name": namecontroller.text,
    "Price": pricecontroller.text,
    "Stock": stockcontroller.text,
    "Category": categorycontroller.text,
    "Description": descriptioncontroller.text,
    "Tags": tagscontroller.text,
    "Image": selectedImages.map((e) => e.path).toList(),
    "Weight": weightcontroller.text,
    "MRP": mrpcontroller.text,
  };
  void addImage(File image, BuildContext context) {
    if (selectedImages.length >= 5) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("You can upload only 5 images")));
      return;
    }
    selectedImages.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    selectedImages?.removeAt(index);
    notifyListeners();
  }

  void addproductdata() {
    productdata.add(tempdata);
    notifyListeners();
  }

  List<UserProductModel> getProductModels() {
    return productdata.map((e) {
      return UserProductModel(
        title: e["Name"] ?? "",
        image: (e["Image"] != null && e["Image"].isNotEmpty)
            ? e["Image"][0]
            : "",
        money: double.tryParse(e["Price"] ?? "0") ?? 0.0,
        description: e["Description"] ?? "",
        offprice: double.tryParse(e["MRP"] ?? "0") ?? 0.0,
        discount: 0.0,
        itemcount: int.tryParse(e["Stock"] ?? "0") ?? 0,
      );
    }).toList();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    pricecontroller.dispose();
    stockcontroller.dispose();
    categorycontroller.dispose();
    descriptioncontroller.dispose();
    tagscontroller.dispose();
    weightcontroller.dispose();
    mrpcontroller.dispose();
    super.dispose();
  }
}
