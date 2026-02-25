import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/core/colors.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Energy Insights",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ).animate().fade().slideX(begin: -0.2, end: 0),

          const SizedBox(height: 24),

          _buildWeeklyChart()
              .animate()
              .fade(delay: 100.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 32),

          Text(
            "Consumption Patterns",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ).animate().fade(delay: 200.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: 16),

          _buildPatternCards()
              .animate()
              .fade(delay: 300.ms)
              .scale(begin: const Offset(0.9, 0.9)),

          const SizedBox(height: 32),

          Text(
            "Tips for you",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ).animate().fade(delay: 400.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: 16),

          _buildTipsList()
              .animate()
              .fade(delay: 500.ms)
              .slideY(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return Container(
      padding: const EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This Week",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "-4% vs last week",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(7, (index) {
              final heights = [60.0, 80.0, 100.0, 70.0, 120.0, 90.0, 140.0];
              final days = ["M", "T", "W", "T", "F", "S", "S"];
              final isToday = index == 6; // Sunday as today for dummy data

              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 32,
                        height: 140, // Max height
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 32,
                        height: heights[index],
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isToday
                                ? [
                                    AppColors.primaryBlue,
                                    AppColors.primaryBlue.withOpacity(0.7),
                                  ]
                                : [
                                    AppColors.ecoGreen,
                                    AppColors.ecoGreen.withOpacity(0.5),
                                  ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: isToday
                              ? [
                                  BoxShadow(
                                    color: AppColors.primaryBlue.withOpacity(
                                      0.3,
                                    ),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    days[index],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                      color: isToday
                          ? AppColors.primaryBlue
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternCards() {
    return Row(
      children: [
        Expanded(
          child: _buildPatternCard(
            title: "Peak Hours",
            value: "7 PM - 10 PM",
            icon: Icons.access_time_filled,
            color: AppColors.solarAmber,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPatternCard(
            title: "Top Appliance",
            value: "Air Cond.",
            icon: Icons.ac_unit,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildPatternCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsList() {
    final tips = [
      {
        "title": "Unplug unused devices",
        "desc": "Standby power accounts for 10% of your bill.",
        "icon": Icons.power,
        "color": AppColors.ecoGreen,
      },
      {
        "title": "Adjust AC by 1°C",
        "desc": "Saves up to 6% of your cooling costs.",
        "icon": Icons.thermostat,
        "color": AppColors.primaryBlue,
      },
    ];

    return Column(
      children: tips.map((tip) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (tip["color"] as Color).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (tip["color"] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  tip["icon"] as IconData,
                  color: tip["color"] as Color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip["title"] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tip["desc"] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
