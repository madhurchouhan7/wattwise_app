import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wattwise_app/feature/plans/model/efficiency_plan_model.dart';
import 'package:wattwise_app/feature/plans/repository/ai_plan_repository.dart';
import 'package:wattwise_app/feature/on_boarding/provider/selected_appliance_notifier.dart';
import 'package:wattwise_app/feature/on_boarding/provider/on_boarding_page_5_notifier.dart';

final aiPlanProvider = FutureProvider.autoDispose<EfficiencyPlanModel>((
  ref,
) async {
  final repository = ref.read(aiPlanRepositoryProvider);
  final appliances = ref.read(selectedAppliancesProvider);
  final applianceStates = ref.read(onBoardingPage5Provider).localStates;

  // For currently missing real values in app state, supply demo inputs
  // User will wire these real values in the Phase 1 step
  final userGoalParams = {
    "goal": "reduce_bill",
    "focusArea": "ai_decide",
    "location": "India",
  };

  final billInfo = {
    "month": "January 2026",
    "unitsConsumed": 450,
    "totalAmount": 3200,
    "pricePerUnit": 7.11,
  };

  return await repository.generatePlan(
    userGoalParams: userGoalParams,
    appliances: appliances,
    applianceStates: applianceStates,
    billInfo: billInfo,
  );
});
