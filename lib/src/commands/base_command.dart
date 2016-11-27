import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:args/command_runner.dart';
import 'package:dangular_cli/src/utils/log.dart';
import 'package:mustache4dart/mustache4dart.dart';
import "package:path/path.dart" show dirname;

class BaseCommand extends Command {
  // Get the path of our script to find the templates
  final _scriptDir = dirname(Platform.script.toFilePath());

  /**
   * Renders all files within [templateName] ____files____ directory with [replacements] using mustache.
   *
   * Outputs them to the [targetDir] folder relative to the current path.
   */
  generateFromTemplate(String templateName, String targetDir, List<Map<String, String>> replacements) async {
    // Get source and target directory
    Directory sourceFilesDir = this.getTemplateFilesDir(templateName);
    Directory targetFolder = await new Directory('${Directory.current.path}/${targetDir}').create(recursive: true);

    Stream<FileSystemEntity> entityList = sourceFilesDir.list(recursive: true, followLinks: false);

    await for (FileSystemEntity entity in entityList) {
      if (entity is File) {
        String fileContent = await entity.readAsString();
        String parsedContent = render(fileContent, replacements);

        String relativePath = path.relative(entity.path, from: sourceFilesDir.path);
        String targetPath = path.join(targetFolder.path, relativePath);

        File result = await new File(targetPath).create(recursive: true);
        await result.writeAsString(parsedContent);

        Log.success('Created file: ${relativePath}');
      }
    }
  }

  /**
   * Gets the Directory of the templates folder by [templateName]
   *
   * This is not where the template files exist
   */
  Directory getTemplateDir(String templateName) {
    return new Directory('${_scriptDir}/templates/${templateName}');
  }

  /**
   * Gets the Directory of the template files folder by [templateName]
   *
   * These are the template files (files within ____files____ folder)
   */
  Directory getTemplateFilesDir(String templateName) {
    return new Directory('${_scriptDir}/templates/${templateName}/__files__');
  }

  /**
   * Gets the Directory where our script lives
   */
  Directory getScriptDir(String templateName) {
    return new Directory(_scriptDir);
  }

  /**
   * Gets the current directory
   */
  Directory getCurrentDir() {
    return Directory.current;
  }

  @override
  String get description => 'baseCommand description';

  @override
  String get name => 'baseCommand';
}
