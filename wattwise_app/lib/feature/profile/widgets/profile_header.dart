import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryBlue.withAlpha(51), // 20% opacity
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: const Color(
                      0xFFEFF6FF,
                    ), // blue.shade50 equivalent
                    backgroundImage: Image.network(
                      'https://avatars.githubusercontent.com/u/30585596?s=400&u=f003965be0a53be549780f833f556bed3a3e95b6&v=4',
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.primaryBlue,
                        );
                      },
                    ).image, // Replace with Sarah's image if preferred
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    padding: const EdgeInsets.all(4.5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
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
              "Member since Jan 2024",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary.withAlpha(200), // ~80% opacity
              ),
            ),
          ],
        );
      },
    );
  }
}
