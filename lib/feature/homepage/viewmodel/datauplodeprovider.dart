import 'dart:io';

import 'package:flutter/material.dart';

import '../../../model/productmodel/userproductmodel.dart';

class Datauplodeprovider extends ChangeNotifier {
  //late int index;
  String? imageerror;
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
  bool isLock = false;
  void toggleLock() {
    isLock = !isLock;
    notifyListeners();
  }

  Map<String, dynamic> get tempdata => {
    "Name": namecontroller.text,
    "Price": pricecontroller.text,
    "Stock": stockcontroller.text,
    "Category": categorycontroller.text,
    "Description": descriptioncontroller.text,
    "Tags": tagscontroller.text.split(','),
    "Image": selectedImages.map((e) => e.path).toList(),
    "Weight": weightcontroller.text,
    "MRP": mrpcontroller.text,
    "isLock": isLock,
  };
  void vaildimage() {
    if (selectedImages.isEmpty) {
      imageerror = "Please select at least one image";
    } else {
      imageerror = null;
    }
    notifyListeners();
  }

  void addImage(File image, BuildContext context) {
    isLock = false;
    selectedImages.add(image);
    imageerror = null;
    notifyListeners();
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    notifyListeners();
  }

  void unlockProduct(Map<String, dynamic> item) {
    item["isLock"] = false;
    notifyListeners();
  }

  void addproductdata(context) {
    productdata.add(tempdata);
    notifyListeners();
    if (productdata.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Product added successfully")));
      clearControllers();
    }
  }

  List<UserProductModel> getProductModels() {
    return productdata.map((e) {
      return UserProductModel(
        title: e["Name"] ?? "",
        image: List<String>.from(e["Image"] ?? []),
        money: double.tryParse(e["Price"] ?? "0") ?? 0.0,
        description: e["Description"] ?? "",
        offprice: double.tryParse(e["MRP"] ?? "0") ?? 0.0,
        discount: 0.0,
        itemcount: int.tryParse(e["Stock"] ?? "0") ?? 0,
        weight: double.tryParse(e["Weight"] ?? "0") ?? 0,
        category: e["Category"] ?? "",
        tags: e["Tags"] ?? '',
        isLock: e["isLock"] ?? false,
      );
    }).toList();
  }

  void loadProductFromModel(UserProductModel product) {
    namecontroller.text = product.title;
    pricecontroller.text = product.money.toString();
    stockcontroller.text = product.itemcount.toString();
    categorycontroller.text = product.category;
    descriptioncontroller.text = product.description;
    tagscontroller.text = product.tags.join(',');
    weightcontroller.text = product.weight.toString();
    mrpcontroller.text = product.offprice.toString();
    isLock = product.isLock;
    selectedImages = product.image.map((e) => File(e)).toList();
    notifyListeners();
  }

  void Update(int index, BuildContext context) {
    vaildimage();
    if (imageerror != null) return;
    productdata[index] = tempdata;
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Product updated successfully")),
    );
    clearControllers();
  }

  void deleteProduct(int index, BuildContext context) {
    if (index < 0 || index >= productdata.length) return;
    productdata.removeAt(index);
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Product deleted successfully")),
    );
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

  void clearControllers() {
    namecontroller.clear();
    pricecontroller.clear();
    stockcontroller.clear();
    categorycontroller.clear();
    descriptioncontroller.clear();
    tagscontroller.clear();
    weightcontroller.clear();
    mrpcontroller.clear();
    selectedImages.clear();
    notifyListeners();
  }
}
