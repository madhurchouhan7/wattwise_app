import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/plans/widgets/cooling_feedback_banner.dart';
import 'package:wattwise_app/feature/plans/widgets/cooling_plan_header.dart';
import 'package:wattwise_app/feature/plans/widgets/cooling_plan_stats_card.dart';
import 'package:wattwise_app/feature/plans/widgets/performance_map_widget.dart';
import 'package:wattwise_app/feature/plans/widgets/action_accordion_item.dart';

class CoolingPlanScreen extends StatelessWidget {
  const CoolingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(
          0xFFEFF6FF,
        ), // soft blue background of banner
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CoolingFeedbackBanner().animate().fade().slideY(
                begin: -0.2,
                end: 0,
                curve: Curves.easeOutQuad,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CoolingPlanHeader()
                        .animate()
                        .fade(delay: 50.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const SizedBox(height: 32),

                    const CoolingPlanStatsCard()
                        .animate()
                        .fade(delay: 150.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const SizedBox(height: 32),

                    const PerformanceMapWidget()
                        .animate()
                        .fade(delay: 250.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const SizedBox(height: 32),

                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's Actions",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFFFF7ED,
                                ), // Light orange bg
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFFFFEDD5),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "🔥 ",
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                  Text(
                                    "5-day streak!",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(
                                        0xFFEA580C,
                                      ), // Orange text
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        .animate()
                        .fade(delay: 350.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const SizedBox(height: 16),

                    const ActionAccordionItem(
                          icon: Icons.ac_unit_rounded,
                          title: "Set AC to 26°C",
                          subtitle: "Maintains efficient cooling load.",
                          initialExpanded: true,
                        )
                        .animate()
                        .fade(delay: 450.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const ActionAccordionItem(
                          icon: Icons.blinds_closed_rounded,
                          title: "Close blinds during day",
                          initialExpanded: false,
                        )
                        .animate()
                        .fade(delay: 550.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const ActionAccordionItem(
                          icon: Icons.local_laundry_service_outlined,
                          title: "Run washing machine full load",
                          initialExpanded: false,
                        )
                        .animate()
                        .fade(delay: 650.ms)
                        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),

                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
