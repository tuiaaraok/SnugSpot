import 'package:game_control/core/drift/tables.dart';

class BoardGameDataSource {
  final AppDatabase _db;
  BoardGameDataSource(this._db);
  Stream<List<BoardGameData>> getBoardGame() {
    return _db.select(_db.boardGame).watch();
  }

  Future insertGame(BoardGameCompanion game) async {
    return _db.into(_db.boardGame).insert(game);
  }
}
