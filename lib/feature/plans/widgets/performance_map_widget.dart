import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';

class PerformanceMapWidget extends StatelessWidget {
  const PerformanceMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ["M", "T", "W", "T", "F", "S", "S"];
    final statusColors = [
      const Color(0xFF34D399), // Emerald
      const Color(0xFF34D399),
      const Color(0xFFFBBF24), // Amber
      const Color(0xFF34D399),
      const Color(0xFFF87171), // Red
      const Color(0xFF34D399),
      Colors.white, // Today
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic cell size based on screen width
        final availableWidth = constraints.maxWidth;
        // 7 blocks + 6 gaps (let's say 8px gap)
        final double spacing = 8.0;
        final double cellSize = (availableWidth - (spacing * 6)) / 7;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Performance Map",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  "Past 7 Days",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary.withAlpha(150),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                final isToday = index == 6; // Sunday

                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          days[index],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: isToday
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isToday
                                ? AppColors.primaryBlue
                                : AppColors.textSecondary.withAlpha(150),
                          ),
                        ),
                        if (isToday)
                          Positioned(
                            top: -2,
                            right: -6,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryBlue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: cellSize,
                      height: cellSize, // Make it square
                      decoration: BoxDecoration(
                        color: statusColors[index],
                        borderRadius: BorderRadius.circular(8),
                        border: isToday
                            ? Border.all(color: AppColors.primaryBlue, width: 2)
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: isToday
                          ? Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                            )
                          : null,
                    ),
                  ],
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
