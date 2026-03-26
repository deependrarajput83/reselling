import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../viewmodel/datauplodeprovider.dart';

class ProductInfoFirstPage extends StatefulWidget {
  const ProductInfoFirstPage({super.key});
  @override
  State<ProductInfoFirstPage> createState() => _ProductInfoFirstPageState();
}

class _ProductInfoFirstPageState extends State<ProductInfoFirstPage> {
  final List<String> Cname = ["Electronics", "Home", "Beauty", "Fashion"];
  String? selectedCat = "Electronics";
  @override
  void initState() {
    super.initState();
    final provider = context.read<Datauplodeprovider>();
    provider.categorycontroller.text = selectedCat!;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Datauplodeprovider>();
    return CommonContainer(
      padding: EdgeInsets.all(AppSize.paddingMd),
      width: double.infinity,
      color: AppColor.ContainerColor,
      border: Border.all(color: Colors.grey.shade300),
      radius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Basic Information"),
          SizedBox(height: 12),
          _inputField(
            label: "Product Name",
            controller: provider.namecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Product name required";
              }
              if (value.length < 3) {
                return "Minimum 3 characters";
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          _priceRow(provider),
          SizedBox(height: 16),
          _stockField(provider),
          SizedBox(height: 16),
          _categoryDropdown(provider),
          SizedBox(height: 20),
          _sectionTitle("Description"),
          SizedBox(height: 8),
          _inputField(
            label: "Product Description",
            controller: provider.descriptioncontroller,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Description required";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.edit_outlined),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _priceRow(Datauplodeprovider provider) {
    return Row(
      children: [
        Expanded(
          child: _inputField(
            label: "Price",
            controller: provider.pricecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              if (double.tryParse(value) == null) {
                return "Invalid number";
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _inputField(
            label: "MRP",
            controller: provider.mrpcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              if (double.tryParse(value) == null) {
                return "Invalid number";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _stockField(Datauplodeprovider provider) {
    return _inputField(
      label: "Stock Quantity",
      controller: provider.stockcontroller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Stock required";
        }
        if (int.tryParse(value) == null) {
          return "Invalid number";
        }
        return null;
      },
    );
  }

  Widget _categoryDropdown(Datauplodeprovider provider) {
    return DropdownButtonFormField(
      value: selectedCat,
      decoration: InputDecoration(
        labelText: "Category",
        prefixIcon: Icon(Icons.category_outlined),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      items: Cname.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCat = value;
          provider.categorycontroller.text = value.toString();
        });
      },
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
      ),
    );
  }
}
