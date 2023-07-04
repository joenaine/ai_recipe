// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModel _$AiModelFromJson(Map<String, dynamic> json) => AiModel(
      model: json['model'] as String?,
      prompt: json['prompt'] as String?,
      maxTokens: json['maxTokens'] as int?,
      temperature: json['temperature'] as int?,
      top_p: json['top_p'] as int?,
    );

Map<String, dynamic> _$AiModelToJson(AiModel instance) => <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'maxTokens': instance.maxTokens,
      'temperature': instance.temperature,
      'top_p': instance.top_p,
    };
