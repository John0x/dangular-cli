import 'package:args/command_runner.dart';
import 'generate/component.dart';

class GenerateCommand extends Command {
  final name = "generate";
  final description = "Generate a resource from template";

  final aliases = ['g', 'gen'];

  GenerateCommand() {
    addSubcommand(new GenerateComponentCommand());
  }
}
