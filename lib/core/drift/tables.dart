import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// ignore: depend_on_referenced_packages
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

part 'tables.g.dart';

class TableReservations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get numberOfPeople => integer()();
  IntColumn get numberTable => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get description => text()();
}

class CafeClubCard extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get numberCard => text()();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text()();
}

class BoardGame extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get numberCard => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  BlobColumn get image => blob()();
}

@DriftDatabase(
  tables: [
    TableReservations,
    CafeClubCard,
    BoardGame,
  ],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
