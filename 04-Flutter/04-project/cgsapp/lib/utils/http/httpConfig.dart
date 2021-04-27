class HttpConfig {
  String baseUrl;
  String appId;
  String secretKey;
  String loginUrl;

  static HttpConfig _instance;

  factory HttpConfig() => _getInstance();

  static HttpConfig get instance => _getInstance();

  HttpConfig._internal();

  static HttpConfig _getInstance() {
    if (_instance == null) {
      _instance = HttpConfig._internal();
    }
    return _instance;
  }
}