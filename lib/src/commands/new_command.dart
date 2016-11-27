import 'package:dangular_cli/src/commands/base_command.dart';
import 'package:dangular_cli/src/utils/log.dart';

class NewCommand extends BaseCommand {
  final name = "new";
  final description = "Generate a new angular 2 dart project";

  List<Map<String, String>> _replacements = [
    {'': ''}
  ];

  NewCommand() {}

  run() async {
    final name = argResults.arguments.length != 0 ? argResults.arguments.first : 'client';

    Log.message('Creating new Angular2Dart application: ${name}');

    await generateFromTemplate('app', name, _replacements);
  }
}
