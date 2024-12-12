// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      env: $enumDecodeNullable(_$AppEnvEnumMap, json['ENV'],
              unknownValue: AppEnv.unknown) ??
          AppEnv.unknown,
      currentBranchName: json['GIT_BRANCH_NAME'] as String? ?? '',
      currentHashCommit: json['GIT_COMMIT_HASH'] as String? ?? '',
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'ENV': _$AppEnvEnumMap[instance.env]!,
      'GIT_COMMIT_HASH': instance.currentHashCommit,
      'GIT_BRANCH_NAME': instance.currentBranchName,
    };

const _$AppEnvEnumMap = {
  AppEnv.production: 'PRODUCTION',
  AppEnv.staging: 'STAGING',
  AppEnv.uat: 'UAT',
  AppEnv.unknown: '',
};
