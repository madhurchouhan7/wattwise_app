import 'package:freezed_annotation/freezed_annotation.dart';

part 'efficiency_plan_model.freezed.dart';
part 'efficiency_plan_model.g.dart';

@freezed
abstract class EfficiencyPlanModel with _$EfficiencyPlanModel {
  const factory EfficiencyPlanModel({
    required String summary,
    required double estimatedCurrentMonthlyCost,
    required EstimatedSavings estimatedSavingsIfFollowed,
    required double efficiencyScore,
    required List<KeyAction> keyActions,
    required SlabAlert slabAlert,
    required List<String> quickWins,
    required String monthlyTip,
  }) = _EfficiencyPlanModel;

  factory EfficiencyPlanModel.fromJson(Map<String, dynamic> json) =>
      _$EfficiencyPlanModelFromJson(json);
}

@freezed
abstract class EstimatedSavings with _$EstimatedSavings {
  const factory EstimatedSavings({
    required double units,
    required double rupees,
    required double percentage,
  }) = _EstimatedSavings;

  factory EstimatedSavings.fromJson(Map<String, dynamic> json) =>
      _$EstimatedSavingsFromJson(json);
}

@freezed
abstract class KeyAction with _$KeyAction {
  const factory KeyAction({
    required String priority,
    required String appliance,
    required String action,
    required String impact,
    required String estimatedSaving,
  }) = _KeyAction;

  factory KeyAction.fromJson(Map<String, dynamic> json) =>
      _$KeyActionFromJson(json);
}

@freezed
abstract class SlabAlert with _$SlabAlert {
  const factory SlabAlert({
    required bool isInDangerZone,
    required String currentSlab,
    double? nextSlabAt,
    double? unitsToNextSlab,
    String? warning,
  }) = _SlabAlert;

  factory SlabAlert.fromJson(Map<String, dynamic> json) =>
      _$SlabAlertFromJson(json);
}
