import 'package:drift/drift.dart';
import 'package:game_control/core/drift/tables.dart';

class ClubCardDataSource {
  final AppDatabase _db;
  ClubCardDataSource(this._db);
  Stream<List<CafeClubCardData>> getClubCard() {
    return _db.select(_db.cafeClubCard).watch();
  }

  Stream<List<CafeClubCardData>> searchClubCards(String query) {
    return (_db.select(_db.cafeClubCard)
          ..where((card) =>
              card.numberCard.like('%$query%') |
              card.phoneNumber.like('%$query%')))
        .watch();
  }

  Future insertGame(CafeClubCardCompanion game) async {
    return _db.into(_db.cafeClubCard).insert(game);
  }
}
