import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/plans/widgets/plan_header.dart';
import 'package:wattwise_app/feature/plans/widgets/active_plan_card.dart';
import 'package:wattwise_app/feature/plans/widgets/plan_stats_row.dart';
import 'package:wattwise_app/feature/plans/widgets/daily_action_tile.dart';
import 'package:wattwise_app/feature/plans/widgets/previous_plan_tile.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  // Dummy states for switches
  bool acSwitch = true;
  bool geyserSwitch = false;
  bool standbySwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlanHeader().animate().fade().slideY(begin: -0.2, end: 0),

              const SizedBox(height: 24),

              const ActivePlanCard()
                  .animate()
                  .fade(delay: 100.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              const PlanStatsRow()
                  .animate()
                  .fade(delay: 200.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              // Daily Actions Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily Actions",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "Manage",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ).animate().fade(delay: 300.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 16),

              DailyActionTile(
                icon: Icons.thermostat_rounded,
                iconColor: AppColors.primaryBlue,
                title: "Set AC to 26°C",
                subtitle: "Daily • 9:00 AM - 6:00 PM",
                isSwitchedOn: acSwitch,
                onChanged: (val) {
                  setState(() {
                    acSwitch = val;
                  });
                },
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1, end: 0),

              DailyActionTile(
                icon: Icons.water_drop_rounded,
                iconColor: AppColors.solarAmber,
                title: "Limit Geyser to 15 mins",
                subtitle: "Daily • Evening Only",
                isSwitchedOn: geyserSwitch,
                onChanged: (val) {
                  setState(() {
                    geyserSwitch = val;
                  });
                },
              ).animate().fade(delay: 500.ms).slideY(begin: 0.1, end: 0),

              DailyActionTile(
                icon: Icons.power_off_rounded,
                iconColor: Colors.purple.shade400,
                title: "Unplug Standby Devices",
                subtitle: "Nightly • Before Bed",
                isSwitchedOn: standbySwitch,
                onChanged: (val) {
                  setState(() {
                    standbySwitch = val;
                  });
                },
              ).animate().fade(delay: 600.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              // Previous Plans Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Previous Plans",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ).animate().fade(delay: 700.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 16),

              const PreviousPlanTile(
                icon: Icons.local_fire_department_rounded,
                title: "Winter Heating",
                dateRange: "Mar 30",
                percentage: "92%",
              ).animate().fade(delay: 800.ms).slideY(begin: 0.1, end: 0),

              const PreviousPlanTile(
                icon: Icons.energy_savings_leaf_rounded,
                title: "Spring Baseline",
                dateRange: "May 30",
                percentage: "78%",
              ).animate().fade(delay: 900.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 60), // Extra space for bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
