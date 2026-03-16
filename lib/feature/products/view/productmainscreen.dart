import 'package:flutter/material.dart';

import '../../../core/commonfile/commonicon.dart';
import '../../../core/commonfile/screensize.dart';
import '../../../core/commonfile/shimmereffact.dart';
import '../../../core/commonstyle/sizes.dart';
import '../../../core/commonwidget/commonappbar.dart';
import '../../../core/commonwidget/commonlistview.dart';
import '../../../core/commonwidget/commontabbar.dart';
import '../../../core/commonwidget/commontextformfiled.dart';
import '../../../repo/apicalling.dart';
import '../../homepage/hometextfile.dart';

class ProductMainScreen extends StatefulWidget {
  final bool isActivep;
  ProductMainScreen({super.key, required this.isActivep});
  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  final productone = Productrepo.getproduct();
  bool isLoading = false;
  @override
  void didUpdateWidget(ProductMainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActivep && !oldWidget.isActivep) {
      startLoadingproduct();
    }
  }

  void startLoadingproduct() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      startLoadingproduct();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: false, title: "Products"),
      body: isLoading
          ? shimmerItem()
          : Padding(
              padding: const EdgeInsets.all(AppSize.paddingSm),
              child: Column(
                children: [
                  Commontextformfiled(
                    controller: TextEditingController(),
                    obscureText: false,
                    hint: "Search products....",
                    prefixIcon: Commonicon.searchicon,
                    suffixIcon: Commonicon.filtericon,
                  ),
                  Expanded(
                    child: CommonTabBar(
                      height: Screensize.height(context) * 0.06,
                      tabs: [
                        AppTextFile.alltab,
                        AppTextFile.electronices,
                        AppTextFile.Home,
                        AppTextFile.Beauty,
                        AppTextFile.fashion,
                      ],
                      views: [
                        Commonlistview(product: productone),
                        Commonlistview(product: productone),
                        Commonlistview(product: productone),
                        Commonlistview(product: productone),
                        Commonlistview(product: productone),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
