import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';
import 'dart:math';

class CoolingPlanStatsCard extends StatelessWidget {
  const CoolingPlanStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            // Adds small light blue accent to top right matching design
            gradient: const LinearGradient(
              colors: [Colors.white, Color(0xFFF8FAFC)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Billing Cycle",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "Day 18",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "/ 30",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary.withAlpha(150),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Linear Progress
                          Stack(
                            children: [
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFF1F5F9,
                                  ), // light grey background
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              LayoutBuilder(
                                builder: (context, boxConstraints) {
                                  return Container(
                                    height: 6,
                                    width: boxConstraints.maxWidth * (18 / 30),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 2,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: const Size(
                                double.infinity,
                                double.infinity,
                              ),
                              painter: DashedCircularProgressPainter(
                                progress: 0.88,
                                color: AppColors.primaryBlue,
                                strokeWidth: 8.0,
                                gapSize: 0.15, // Creates large gaps in arc
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "88%",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                    height: 1.0,
                                  ),
                                ),
                                Text(
                                  "Score",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFFF1F5F9), // Divider line
                margin: const EdgeInsets.symmetric(horizontal: 24),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Est. Savings Target",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹1,200",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7), // Light green bg
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "On Track",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF16A34A), // Text Green
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashedCircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;
  final double gapSize;

  DashedCircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
    required this.gapSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -pi / 2; // Top
    final double radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final bgPaint = Paint()
      ..color = const Color(0xFFEFF6FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw background segments with gap
    final totalLength = 2 * pi;
    final segmentCount = 4;
    final sweepAngle = (totalLength / segmentCount) - gapSize;

    // Background segments
    for (int i = 0; i < segmentCount; i++) {
      double segStart =
          startAngle + i * (totalLength / segmentCount) + gapSize / 2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segStart,
        sweepAngle,
        false,
        bgPaint,
      );
    }

    // Active segments up to progress
    // Very simplified logic to draw the actual progress as full colored active segments
    double currentProgressArc = totalLength * progress;
    double drawnLength = 0;

    for (int i = 0; i < segmentCount; i++) {
      if (drawnLength >= currentProgressArc) break;

      double segStart =
          startAngle + i * (totalLength / segmentCount) + gapSize / 2;

      // Calculate how much of this segment to draw
      double drawSweep = sweepAngle;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segStart,
        drawSweep, // simplify full active segment drawing for score
        false,
        progressPaint,
      );
      drawnLength += sweepAngle + gapSize;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
