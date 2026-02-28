import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';

class CoolingPlanHeader extends StatelessWidget {
  const CoolingPlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACTIVE PLAN",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary.withAlpha(150),
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "Summer Cooling",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.ac_unit_rounded,
                      color: AppColors.primaryBlue,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.textSecondary,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                  icon: const Icon(
                    Icons.ios_share_rounded,
                    color: AppColors.textSecondary,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
