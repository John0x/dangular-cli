class Log {
  static now() => '[${new DateTime.now().toString().substring(11, 19)}]';

  static message(text) => print('${now()}[info] $text');
  static error(text) => print('${now()}[error] $text');
  static success(text) => print('${now()}[success] $text');
  static warning(text) => print('${now()}[warning] $text');
}