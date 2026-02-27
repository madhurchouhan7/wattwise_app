import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/profile/widgets/profile_header.dart';
import 'package:wattwise_app/feature/profile/widgets/profile_stats_card.dart';
import 'package:wattwise_app/feature/profile/widgets/profile_menu_section.dart';
import 'package:wattwise_app/feature/profile/widgets/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              const ProfileHeader().animate().fade().scale(
                begin: const Offset(0.9, 0.9),
                duration: 400.ms,
                curve: Curves.easeOutBack,
              ),

              const SizedBox(height: 32),

              const ProfileStatsCard()
                  .animate()
                  .fade(delay: 100.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              ProfileMenuSection(
                title: "ACCOUNT",
                items: [
                  MenuItemData(
                    icon: Icons.person_outline_rounded,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  MenuItemData(
                    icon: Icons.kitchen_rounded,
                    title: "Manage Appliances",
                    onTap: () {},
                  ),
                ],
              ).animate().fade(delay: 200.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              ProfileMenuSection(
                title: "FEATURES",
                items: [
                  MenuItemData(
                    icon: Icons.settings_outlined,
                    title: "Settings",
                    onTap: () {},
                  ),
                  MenuItemData(
                    icon: Icons.solar_power_outlined,
                    title: "Solar Calculator",
                    onTap: () {},
                  ),
                ],
              ).animate().fade(delay: 300.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              ProfileMenuSection(
                title: "HELP & INFO",
                items: [
                  MenuItemData(
                    icon: Icons.receipt_long_outlined,
                    title: "How to read bill",
                    onTap: () {},
                  ),
                  MenuItemData(
                    icon: Icons.help_outline_rounded,
                    title: "FAQs",
                    onTap: () {},
                  ),
                  MenuItemData(
                    icon: Icons.support_agent_rounded,
                    title: "Contact Support",
                    onTap: () {},
                  ),
                ],
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              ProfileMenuSection(
                title:
                    null, // Legal has no title over it according to the design
                items: [
                  MenuItemData(
                    icon: Icons.gavel_rounded,
                    title: "Legal",
                    onTap: () {},
                  ),
                ],
              ).animate().fade(delay: 500.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              LogoutButton(
                onPressed: () {},
              ).animate().fade(delay: 600.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              Text(
                "Version 2.4.0",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary.withAlpha(150),
                ),
              ).animate().fade(delay: 700.ms),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
