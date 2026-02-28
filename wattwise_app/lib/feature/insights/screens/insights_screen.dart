import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wattwise_app/feature/insights/widgets/insights_header.dart';
import 'package:wattwise_app/feature/insights/widgets/efficiency_score_card.dart';
import 'package:wattwise_app/feature/insights/widgets/daily_intensity_card.dart';
import 'package:wattwise_app/feature/insights/widgets/appliance_breakdown_card.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const InsightsHeader().animate().fade().slideY(
                begin: -0.2,
                end: 0,
              ),

              const SizedBox(height: 32),

              const EfficiencyScoreCard()
                  .animate()
                  .fade(delay: 100.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              const DailyIntensityCard()
                  .animate()
                  .fade(delay: 200.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              const ApplianceBreakdownCard()
                  .animate()
                  .fade(delay: 300.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
