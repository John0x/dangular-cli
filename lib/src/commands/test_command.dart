import 'package:args/command_runner.dart';

class TestCommand extends Command {
  final name = "test";
  final description = "Test help.";

  TestCommand() {
    // [argParser] is automatically created by the parent class.
  }

  // [run] may also return a Future.
  void run() {
    // [argResults] is set before [run()] is called and contains the options
    // passed to this command.
    print('Test!!!');
  }
}
