import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

AppConfig get appConfig => AppConfig.instance;

void setConfig(Map<String, String> env) {
  AppConfig._instance = AppConfig.fromJson(env);
}

enum AppEnv {
  @JsonValue('PRODUCTION')
  production,
  @JsonValue('STAGING')
  staging,
  @JsonValue('UAT')
  uat,
  @JsonValue('')
  unknown,
}

@JsonSerializable()
class AppConfig {
  @JsonKey(name: 'ENV', unknownEnumValue: AppEnv.unknown)
  final AppEnv env;
  @JsonKey(name: 'GIT_COMMIT_HASH')
  final String currentHashCommit;
  @JsonKey(name: 'GIT_BRANCH_NAME')
  final String currentBranchName;

  AppConfig({
    this.env = AppEnv.unknown,
    this.currentBranchName = '',
    this.currentHashCommit = '',
  });

  static AppConfig? _instance;

  static AppConfig get instance => _instance ?? AppConfig.fromJson({});

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
