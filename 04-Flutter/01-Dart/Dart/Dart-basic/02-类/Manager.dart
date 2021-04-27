class Manager {
  factory Manager() => _getInstance();

  static Manager get instance => _getInstance();

  static Manager _instance;

  Manager._internal() {}

  static Manager _getInstance() {
    if (_instance == null) {
      _instance = Manager._internal();
    }
    return _instance;
  }
}
