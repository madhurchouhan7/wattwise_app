import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/feature/root/providers/root_navigation_provider.dart';
import 'package:wattwise_app/feature/dashboard/screens/dashboard_screen.dart';
import 'package:wattwise_app/feature/usage/screens/usage_screen.dart';
import 'package:wattwise_app/feature/bills/screens/bills_screen.dart';
import 'package:wattwise_app/feature/profile/screens/profile_screen.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    final screens = [
      const DashboardScreen(),
      const BillsScreen(),
      const SizedBox(), // Placeholder for the middle FAB
      const UsageScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: screens[currentIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SizedBox(
          width: 56,
          height: 56,
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF1E60F2),
            shape: const CircleBorder(),
            elevation: 4,
            onPressed: () {},
            child: const Icon(Icons.bolt, color: Colors.white, size: 32),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(ref, currentIndex),
    );
  }

  Widget _buildBottomNavBar(WidgetRef ref, int currentIndex) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      elevation: 20,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              index: 0,
              icon: Icons.home_outlined,
              label: 'Home',
              currentIndex: currentIndex,
              ref: ref,
            ),
            _buildNavItem(
              index: 1,
              icon: Icons.receipt_long_outlined,
              label: 'Bills',
              currentIndex: currentIndex,
              ref: ref,
            ),
            const SizedBox(width: 48), // Space for FAB
            _buildNavItem(
              index: 3,
              icon: Icons.bar_chart_outlined,
              label: 'Usage',
              currentIndex: currentIndex,
              ref: ref,
            ),
            _buildNavItem(
              index: 4,
              icon: Icons.person_outline,
              label: 'Profile',
              currentIndex: currentIndex,
              ref: ref,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required int currentIndex,
    required WidgetRef ref,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected
        ? const Color(0xFF1E60F2)
        : const Color(0xFF94A3B8);

    return InkWell(
      onTap: () => ref.read(bottomNavProvider.notifier).state = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
