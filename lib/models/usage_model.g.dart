// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json['promptTokens'] as int?,
      completionTokens: json['completionTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };
