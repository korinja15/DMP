import 'dart:io';
import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Talkvee/src/services/contacts_service.dart';

abstract class DatabaseService {
  ObjectDB get db;
  String get filepath;

  Future<void> open() => db.open(false);

  Future<String> getPath() async {
    var path = await _localFile(filepath);
    return path.path;
  }

  Future<File> _localFile(String data) async {
    final path = await _localPath();
    return File('$path/$data.db');
  }

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> close() => db.close();
}
