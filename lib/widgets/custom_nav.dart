// custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size.width;
    return BlocBuilder<NavigationCubit, NavItem>(
      builder: (context, currentNavItem) {
        return Container(
          width: screenSize * 0.85,
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xff282b62),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 8)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                icon: Icons.home,
                label: 'Home',
                navItem: NavItem.home,
                currentNavItem: currentNavItem,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.person,
                label: 'Profile',
                navItem: NavItem.profile,
                currentNavItem: currentNavItem,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.bookmark_add,
                label: 'Booking',
                navItem: NavItem.book,
                currentNavItem: currentNavItem,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.add_box_outlined,
                label: 'reviews',
                navItem: NavItem.reviews,
                currentNavItem: currentNavItem,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required NavItem navItem,
    required NavItem currentNavItem,
  }) {
    final bool isSelected = currentNavItem == navItem;

    return GestureDetector(
      onTap: () {
        context.read<NavigationCubit>().navigateTo(navItem);
      },
      child: Container(
        height: 40,
        width: isSelected ? 100 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 3,
          children: [
            Icon(icon, color: Color(0xff282b62)),
            Text(
              isSelected ? label : '',
              style: TextStyle(
                color: Color(0xff282b62),
                fontWeight: FontWeight.w700,
                fontFamily: 'cairo',
              ),
            ),
          ],
        ),
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Icon(
      //       icon,
      //       color: isSelected ? Colors.blue : Colors.grey,
      //       size: 24,
      //     ),
      //     const SizedBox(height: 4),
      //     Text(
      //       label,
      //       style: TextStyle(
      //         color: isSelected ? Colors.blue : Colors.grey,
      //         fontSize: 12,
      //         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
