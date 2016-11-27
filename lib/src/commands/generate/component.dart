import 'dart:io';
import "package:path/path.dart" show dirname;
import 'package:args/command_runner.dart';

class GenerateComponentCommand extends Command {
  final name = "component";
  final description = "Generate an angular 2 component";

  final aliases = ['c', 'comp'];

  final _currentDir = dirname(Platform.script.toFilePath());

  GenerateComponentCommand() {

  }

  run() {
    print(_currentDir);
    Directory dir = new Directory(_currentDir);
    dir.list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  }
}
