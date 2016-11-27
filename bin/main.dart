import 'package:args/command_runner.dart';
import 'package:dangular_cli/angular_cli.dart';

void main(List<String> arguments) {
  var runner = new CommandRunner("dang", "Angular 2 Dart CLI")
    ..addCommand(new NewCommand())
    ..addCommand(new GenerateCommand());

  runner.run(arguments);
}
