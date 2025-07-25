import 'package:game_control/core/drift/tables.dart';

class TableReservationDataSource {
  final AppDatabase _db;
  TableReservationDataSource(this._db);

  Stream<TableReservationWithFreeTable> getTableReservation(
      DateTime date, int totalTable) {
    final query = _db.select(_db.tableReservations)
      ..where((filter) => filter.date.equals(date));

    return query.watch().map((reservations) {
      // Get unique table numbers from reservations
      final reservedTables = reservations.map((r) => r.numberTable).toSet();

      // Assuming you have a way to get total tables count
      // This should be replaced with your actual total tables count

      final freeTables = totalTable - reservedTables.length;

      return TableReservationWithFreeTable(
        freeTableTables: freeTables,
        tableReservations: reservations,
      );
    });
  }

  insertTableReservation(TableReservationsCompanion table) {
    _db.into(_db.tableReservations).insert(table);
  }
}

class TableReservationWithFreeTable {
  final int freeTableTables;
  final List<TableReservation> tableReservations;

  TableReservationWithFreeTable({
    required this.freeTableTables,
    required this.tableReservations,
  });
}
