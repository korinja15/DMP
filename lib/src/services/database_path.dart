import 'dart:io';
import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseTools {
  final String name;

  DatabaseTools({this.name});

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile() async {
    final path = await _localPath();
    return File('$path/$name.db');
  }

  Future<String> getPath() async {
    final File file = await _localFile();
    return file.path;
  }

  Future<ObjectDB> getDB() async {
    return ObjectDB(await getPath());
  }
}
