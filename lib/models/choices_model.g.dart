// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      text: json['text'] as String?,
      index: json['index'] as int?,
      logprobs: json['logprobs'] as String?,
      finishReason: json['finishReason'] as String?,
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'text': instance.text,
      'index': instance.index,
      'logprobs': instance.logprobs,
      'finishReason': instance.finishReason,
    };
