import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/insights/providers/insights_provider.dart';

class DailyIntensityCard extends ConsumerWidget {
  const DailyIntensityCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intensityData = ref.watch(dailyIntensityProvider);
    final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic cell size based on screen width
        final padding = 24.0 * 2; // Card horizontal padding
        final spacing = 8.0 * 6; // Space between 7 columns
        final availableWidth = constraints.maxWidth - padding - spacing;
        final double cellSize = availableWidth / 7;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5), // ~2% opacity
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily Intensity",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Last 30 Days",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Days header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days.map((day) {
                  return SizedBox(
                    width: cellSize,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textSecondary.withAlpha(150),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),

              // Heatmap Grid
              _buildHeatmapRow(intensityData.sublist(0, 7), cellSize),
              const SizedBox(height: 8),
              _buildHeatmapRow(intensityData.sublist(7, 14), cellSize),

              const SizedBox(height: 20),

              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Less",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildLegendBox(0),
                  const SizedBox(width: 4),
                  _buildLegendBox(1),
                  const SizedBox(width: 4),
                  _buildLegendBox(2),
                  const SizedBox(width: 4),
                  _buildLegendBox(3),
                  const SizedBox(width: 8),
                  Text(
                    "More",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeatmapRow(List<int> dataRow, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dataRow.map((val) {
        return _buildHeatmapCell(val, size);
      }).toList(),
    );
  }

  Widget _buildHeatmapCell(int level, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getColorForLevel(level),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: level == 3
          ? Text(
              "HI",
              style: GoogleFonts.poppins(
                fontSize: size * 0.35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  Widget _buildLegendBox(int level) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: _getColorForLevel(level),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Color _getColorForLevel(int level) {
    switch (level) {
      case 0:
        return const Color(0xFFE2E8F0); // light greyish blue
      case 1:
        return const Color(0xFFBFDBFE); // light blue
      case 2:
        return const Color(0xFF60A5FA); // mid blue
      case 3:
        return AppColors.primaryBlue; // dark blue
      default:
        return const Color(0xFFE2E8F0);
    }
  }
}
