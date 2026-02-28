import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy provider for currently selected month
final selectedMonthProvider = StateProvider<String>((ref) => 'Sep 2023');

// Dummy provider for appliance breakdown data
final applianceBreakdownProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {'name': 'AC', 'percentage': 40, 'colorHex': 0xFF2563EB}, // Primary blue
    {'name': 'Fridge', 'percentage': 20, 'colorHex': 0xFF93C5FD}, // Light blue
    {'name': 'Other', 'percentage': 40, 'colorHex': 0xFFE2E8F0}, // Light grey
  ];
});

// Dummy provider for daily intensity (heatmap data)
// 0: low/none, 1: light, 2: medium, 3: high (HI)
final dailyIntensityProvider = Provider<List<int>>((ref) {
  return [
    0, 1, 1, 2, 3, 1, 0, // Week 1
    0, 0, 2, 1, 1, 3, 1, // Week 2
  ];
});
