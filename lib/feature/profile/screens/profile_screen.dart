import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/core/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileHeader().animate().fade().scale(
            begin: const Offset(0.9, 0.9),
          ),

          const SizedBox(height: 32),

          _buildOptionsList()
              .animate()
              .fade(delay: 200.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 32),

          TextButton(
            onPressed: () {},
            child: Text(
              "Log Out",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.alertRed,
              ),
            ),
          ).animate().fade(delay: 300.ms),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryBlue, width: 2),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/30585596?s=400&u=f003965be0a53be549780f833f556bed3a3e95b6&v=4",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Madhur Chouhan",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Premium Member",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsList() {
    final options = [
      {
        "icon": Icons.home_work,
        "title": "Home Details",
        "subtitle": "Manage rooms & devices",
      },
      {
        "icon": Icons.notifications,
        "title": "Notifications",
        "subtitle": "Alerts & reminders",
      },
      {
        "icon": Icons.security,
        "title": "Privacy & Security",
        "subtitle": "Passwords & 2FA",
      },
      {
        "icon": Icons.help,
        "title": "Help & Support",
        "subtitle": "FAQs & Contact us",
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: options.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item["icon"] as IconData,
                    color: AppColors.textPrimary,
                  ),
                ),
                title: Text(
                  item["title"] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                subtitle: Text(
                  item["subtitle"] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
                onTap: () {},
              ),
              if (index < options.length - 1)
                Divider(
                  height: 1,
                  color: AppColors.background,
                  indent: 70,
                  endIndent: 20,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
