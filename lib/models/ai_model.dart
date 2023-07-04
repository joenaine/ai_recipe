import 'package:json_annotation/json_annotation.dart';

part 'ai_model.g.dart';

@JsonSerializable()
class AiModel {
  final String? model;
  final String? prompt;
  final int? maxTokens;
  final int? temperature;
  final int? top_p;

  AiModel(
      {this.model, this.prompt, this.maxTokens, this.temperature, this.top_p});
  factory AiModel.fromJson(Map<String, dynamic> json) =>
      _$AiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AiModelToJson(this);
}
