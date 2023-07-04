import 'package:json_annotation/json_annotation.dart';

import 'choices_model.dart';
import 'usage_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  ResponseModel(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});
  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
