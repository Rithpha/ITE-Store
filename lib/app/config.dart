class Config {
  static final _instance = Config._internal();
  Config._internal();
  factory Config() => _instance;

  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  String get appName {
    switch (env) {
      case 'prod':
        return 'ITE Store';
      case 'uat':
        return 'ITE Store Test';
      case 'demo':
        return 'ITE Store Demo';
      default:
        return 'ITE Store Dev';
    }
  }

  bool get isDemo => env == 'demo';

  String get apiBaseUrl {
    switch (env) {
      case 'prod':
        return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/prod/';
      case 'uat':
        return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/uat/';
      case 'demo':
        return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/demo/';
      default:
        return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/dev/';
    }
  }
}
