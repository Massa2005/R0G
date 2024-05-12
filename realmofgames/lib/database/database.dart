import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao.dart';
import 'models.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Gioco, Utentedb, NetworkSpec])
abstract class AppDatabase extends FloorDatabase {
  GiocoDao get giocodao;

}