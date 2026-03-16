import 'package:flutter/material.dart';

import '../commonstyle/colorstyle.dart';
import '../commonstyle/sizes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final IconData? iconOne;
  final IconData? iconTwo;
  final double iconSizeOne;
  final double iconSizeTwo;
  final VoidCallback? IconFirst;
  final VoidCallback? Iconsecond;
  final String? imagepicker;
  final bool showCircle;
  final VoidCallback? onPressed;
  const CommonAppBar({
    super.key,
    this.title,
    required this.showBack,
    this.iconOne,
    this.iconTwo,
    this.iconSizeOne = 28,
    this.iconSizeTwo = 28,
    this.IconFirst,
    this.Iconsecond,
    this.imagepicker,
    this.showCircle = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.all(AppSize.paddingMd),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBack
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: AppColor.whitebutton),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title ?? "",
        style: TextStyle(color: Colors.white, fontFamily: "poppins"),
      ),
      actions: [
        if (iconOne != null)
          GestureDetector(
            onTap: IconFirst,
            child: Icon(iconOne, size: iconSizeOne, color: Colors.white),
          ),
        if (imagepicker != null)
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                showCircle
                    ? CircleAvatar(
                        child: Image.asset(
                          imagepicker!,
                          fit: BoxFit.fill,
                          height: 29,
                          width: 30,
                        ),
                      )
                    : Image.asset(
                        imagepicker!,
                        fit: BoxFit.fill,
                        height: 29,
                        width: 30,
                      ),
              ],
            ),
          ),
        if (iconOne != null && iconTwo != null) const SizedBox(width: 12),
        if (iconTwo != null)
          GestureDetector(
            onTap: Iconsecond,
            child: Icon(iconTwo, size: iconSizeTwo, color: Colors.white),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
