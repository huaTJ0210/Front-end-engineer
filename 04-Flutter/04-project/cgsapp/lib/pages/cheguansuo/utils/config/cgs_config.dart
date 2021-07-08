class CGSHttpConfig {
  String baseUrl;
  String appId;
  String secretKey;
  String loginUrl;

  static CGSHttpConfig _instance;

  factory CGSHttpConfig() => _getInstance();

  static CGSHttpConfig get instance => _getInstance();

  CGSHttpConfig._internal();

  static CGSHttpConfig _getInstance() {
    if (_instance == null) {
      _instance = CGSHttpConfig._internal();
    }
    return _instance;
  }
}