import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/homepage/view/widget/stockoverview/producteditdata/productinfo.dart';
import '../../feature/homepage/viewmodel/datauplodeprovider.dart';
import 'commonimagepicker.dart';

class Commonlistview extends StatelessWidget {
  final String category;
  const Commonlistview({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    final allProducts = context.watch<Datauplodeprovider>().getProductModels();
    final productone = allProducts.where((e) {
      if (category == "Locked") {
        return e.isLock == true;
      }
      if (category == "All") {
        return e.isLock == false;
      }
      return e.isLock == false &&
          e.category.toLowerCase() == category.toLowerCase();
    }).toList();
    if (productone.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.inventory_2_outlined, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "No Products Found",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productone.length,
      itemBuilder: (context, index) {
        final pr = productone[index];
        bool isOutStock = pr.itemcount == 0;
        bool isLowStock = pr.itemcount > 0 && pr.itemcount <= 10;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductInfo(productInformation: pr),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imagepicker(
                    imagepath: pr.image.isNotEmpty ? pr.image.first : "",
                    height: 75,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pr.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "₹${pr.money}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "₹${pr.offprice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _stockBadge(
                        context,
                        pr.itemcount,
                        isOutStock,
                        isLowStock,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _stockBadge(BuildContext context, int stock, bool out, bool low) {
    Color color;
    if (out) {
      color = Colors.red;
    } else if (low) {
      color = Colors.orange;
    } else {
      color = Colors.green;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        out ? "OUT OF STOCK" : "Stock: $stock",
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
