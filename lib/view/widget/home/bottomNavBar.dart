import 'package:flutter/material.dart';
import '../../../core/const/app_color.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final dynamic Function(int)? onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        child: BottomAppBar(
          height: 55,
          notchMargin: 5.0,
          elevation: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColor.primary,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                  currentIndex == 0
                      ? Icons.person
                      : Icons.perm_identity_sharp,
                  0),
              _buildNavItem(
                  currentIndex == 1
                      ? Icons.category
                      : Icons.category_outlined,
                  1),
              const Spacer(
                flex: 2,
              ),
              _buildNavItem(
                  currentIndex == 3
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  3),
              _buildNavItem(
                  currentIndex == 4
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined,
                  4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Expanded(
      child: InkWell(
        radius: 5,
        splashColor: AppColor.primaryLight,
        onTap: () {
          if (onTap != null) {
            onTap!(index);
          }
        },
        child: Icon(
          icon,
          size: 30,
          color:
              currentIndex == index ? AppColor.black : AppColor.white,
        ),
      ),
    );
  }
}
