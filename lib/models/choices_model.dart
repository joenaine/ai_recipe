import 'package:json_annotation/json_annotation.dart';

part 'choices_model.g.dart';

@JsonSerializable()
class Choices {
  String? text;
  int? index;
  String? logprobs;
  String? finishReason;

  Choices({this.text, this.index, this.logprobs, this.finishReason});

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);

  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}
