// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// ignore_for_file: type=lint
class $TableReservationsTable extends TableReservations
    with TableInfo<$TableReservationsTable, TableReservation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableReservationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberOfPeopleMeta =
      const VerificationMeta('numberOfPeople');
  @override
  late final GeneratedColumn<int> numberOfPeople = GeneratedColumn<int>(
      'number_of_people', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberTableMeta =
      const VerificationMeta('numberTable');
  @override
  late final GeneratedColumn<int> numberTable = GeneratedColumn<int>(
      'number_table', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        numberOfPeople,
        numberTable,
        date,
        startTime,
        endTime,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_reservations';
  @override
  VerificationContext validateIntegrity(Insertable<TableReservation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number_of_people')) {
      context.handle(
          _numberOfPeopleMeta,
          numberOfPeople.isAcceptableOrUnknown(
              data['number_of_people']!, _numberOfPeopleMeta));
    } else if (isInserting) {
      context.missing(_numberOfPeopleMeta);
    }
    if (data.containsKey('number_table')) {
      context.handle(
          _numberTableMeta,
          numberTable.isAcceptableOrUnknown(
              data['number_table']!, _numberTableMeta));
    } else if (isInserting) {
      context.missing(_numberTableMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableReservation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableReservation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      numberOfPeople: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_people'])!,
      numberTable: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_table'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TableReservationsTable createAlias(String alias) {
    return $TableReservationsTable(attachedDatabase, alias);
  }
}

class TableReservation extends DataClass
    implements Insertable<TableReservation> {
  final int id;
  final String name;
  final int numberOfPeople;
  final int numberTable;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String description;
  const TableReservation(
      {required this.id,
      required this.name,
      required this.numberOfPeople,
      required this.numberTable,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['number_of_people'] = Variable<int>(numberOfPeople);
    map['number_table'] = Variable<int>(numberTable);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['description'] = Variable<String>(description);
    return map;
  }

  TableReservationsCompanion toCompanion(bool nullToAbsent) {
    return TableReservationsCompanion(
      id: Value(id),
      name: Value(name),
      numberOfPeople: Value(numberOfPeople),
      numberTable: Value(numberTable),
      date: Value(date),
      startTime: Value(startTime),
      endTime: Value(endTime),
      description: Value(description),
    );
  }

  factory TableReservation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableReservation(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      numberOfPeople: serializer.fromJson<int>(json['numberOfPeople']),
      numberTable: serializer.fromJson<int>(json['numberTable']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'numberOfPeople': serializer.toJson<int>(numberOfPeople),
      'numberTable': serializer.toJson<int>(numberTable),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'description': serializer.toJson<String>(description),
    };
  }

  TableReservation copyWith(
          {int? id,
          String? name,
          int? numberOfPeople,
          int? numberTable,
          DateTime? date,
          DateTime? startTime,
          DateTime? endTime,
          String? description}) =>
      TableReservation(
        id: id ?? this.id,
        name: name ?? this.name,
        numberOfPeople: numberOfPeople ?? this.numberOfPeople,
        numberTable: numberTable ?? this.numberTable,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        description: description ?? this.description,
      );
  TableReservation copyWithCompanion(TableReservationsCompanion data) {
    return TableReservation(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      numberOfPeople: data.numberOfPeople.present
          ? data.numberOfPeople.value
          : this.numberOfPeople,
      numberTable:
          data.numberTable.present ? data.numberTable.value : this.numberTable,
      date: data.date.present ? data.date.value : this.date,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TableReservation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfPeople: $numberOfPeople, ')
          ..write('numberTable: $numberTable, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, numberOfPeople, numberTable, date,
      startTime, endTime, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableReservation &&
          other.id == this.id &&
          other.name == this.name &&
          other.numberOfPeople == this.numberOfPeople &&
          other.numberTable == this.numberTable &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.description == this.description);
}

class TableReservationsCompanion extends UpdateCompanion<TableReservation> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> numberOfPeople;
  final Value<int> numberTable;
  final Value<DateTime> date;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String> description;
  const TableReservationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.numberOfPeople = const Value.absent(),
    this.numberTable = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.description = const Value.absent(),
  });
  TableReservationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int numberOfPeople,
    required int numberTable,
    required DateTime date,
    required DateTime startTime,
    required DateTime endTime,
    required String description,
  })  : name = Value(name),
        numberOfPeople = Value(numberOfPeople),
        numberTable = Value(numberTable),
        date = Value(date),
        startTime = Value(startTime),
        endTime = Value(endTime),
        description = Value(description);
  static Insertable<TableReservation> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? numberOfPeople,
    Expression<int>? numberTable,
    Expression<DateTime>? date,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numberOfPeople != null) 'number_of_people': numberOfPeople,
      if (numberTable != null) 'number_table': numberTable,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (description != null) 'description': description,
    });
  }

  TableReservationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? numberOfPeople,
      Value<int>? numberTable,
      Value<DateTime>? date,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime,
      Value<String>? description}) {
    return TableReservationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      numberTable: numberTable ?? this.numberTable,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numberOfPeople.present) {
      map['number_of_people'] = Variable<int>(numberOfPeople.value);
    }
    if (numberTable.present) {
      map['number_table'] = Variable<int>(numberTable.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableReservationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfPeople: $numberOfPeople, ')
          ..write('numberTable: $numberTable, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CafeClubCardTable extends CafeClubCard
    with TableInfo<$CafeClubCardTable, CafeClubCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CafeClubCardTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberCardMeta =
      const VerificationMeta('numberCard');
  @override
  late final GeneratedColumn<String> numberCard = GeneratedColumn<String>(
      'number_card', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, numberCard, name, phoneNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cafe_club_card';
  @override
  VerificationContext validateIntegrity(Insertable<CafeClubCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number_card')) {
      context.handle(
          _numberCardMeta,
          numberCard.isAcceptableOrUnknown(
              data['number_card']!, _numberCardMeta));
    } else if (isInserting) {
      context.missing(_numberCardMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CafeClubCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CafeClubCardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      numberCard: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number_card'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $CafeClubCardTable createAlias(String alias) {
    return $CafeClubCardTable(attachedDatabase, alias);
  }
}

class CafeClubCardData extends DataClass
    implements Insertable<CafeClubCardData> {
  final int id;
  final String numberCard;
  final String name;
  final String phoneNumber;
  const CafeClubCardData(
      {required this.id,
      required this.numberCard,
      required this.name,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number_card'] = Variable<String>(numberCard);
    map['name'] = Variable<String>(name);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  CafeClubCardCompanion toCompanion(bool nullToAbsent) {
    return CafeClubCardCompanion(
      id: Value(id),
      numberCard: Value(numberCard),
      name: Value(name),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory CafeClubCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CafeClubCardData(
      id: serializer.fromJson<int>(json['id']),
      numberCard: serializer.fromJson<String>(json['numberCard']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numberCard': serializer.toJson<String>(numberCard),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  CafeClubCardData copyWith(
          {int? id, String? numberCard, String? name, String? phoneNumber}) =>
      CafeClubCardData(
        id: id ?? this.id,
        numberCard: numberCard ?? this.numberCard,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  CafeClubCardData copyWithCompanion(CafeClubCardCompanion data) {
    return CafeClubCardData(
      id: data.id.present ? data.id.value : this.id,
      numberCard:
          data.numberCard.present ? data.numberCard.value : this.numberCard,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CafeClubCardData(')
          ..write('id: $id, ')
          ..write('numberCard: $numberCard, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, numberCard, name, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CafeClubCardData &&
          other.id == this.id &&
          other.numberCard == this.numberCard &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber);
}

class CafeClubCardCompanion extends UpdateCompanion<CafeClubCardData> {
  final Value<int> id;
  final Value<String> numberCard;
  final Value<String> name;
  final Value<String> phoneNumber;
  const CafeClubCardCompanion({
    this.id = const Value.absent(),
    this.numberCard = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  CafeClubCardCompanion.insert({
    this.id = const Value.absent(),
    required String numberCard,
    required String name,
    required String phoneNumber,
  })  : numberCard = Value(numberCard),
        name = Value(name),
        phoneNumber = Value(phoneNumber);
  static Insertable<CafeClubCardData> custom({
    Expression<int>? id,
    Expression<String>? numberCard,
    Expression<String>? name,
    Expression<String>? phoneNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numberCard != null) 'number_card': numberCard,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    });
  }

  CafeClubCardCompanion copyWith(
      {Value<int>? id,
      Value<String>? numberCard,
      Value<String>? name,
      Value<String>? phoneNumber}) {
    return CafeClubCardCompanion(
      id: id ?? this.id,
      numberCard: numberCard ?? this.numberCard,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numberCard.present) {
      map['number_card'] = Variable<String>(numberCard.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CafeClubCardCompanion(')
          ..write('id: $id, ')
          ..write('numberCard: $numberCard, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }
}

class $BoardGameTable extends BoardGame
    with TableInfo<$BoardGameTable, BoardGameData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardGameTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberCardMeta =
      const VerificationMeta('numberCard');
  @override
  late final GeneratedColumn<String> numberCard = GeneratedColumn<String>(
      'number_card', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, numberCard, name, description, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_game';
  @override
  VerificationContext validateIntegrity(Insertable<BoardGameData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number_card')) {
      context.handle(
          _numberCardMeta,
          numberCard.isAcceptableOrUnknown(
              data['number_card']!, _numberCardMeta));
    } else if (isInserting) {
      context.missing(_numberCardMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BoardGameData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardGameData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      numberCard: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number_card'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $BoardGameTable createAlias(String alias) {
    return $BoardGameTable(attachedDatabase, alias);
  }
}

class BoardGameData extends DataClass implements Insertable<BoardGameData> {
  final int id;
  final String numberCard;
  final String name;
  final String description;
  final Uint8List image;
  const BoardGameData(
      {required this.id,
      required this.numberCard,
      required this.name,
      required this.description,
      required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number_card'] = Variable<String>(numberCard);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<Uint8List>(image);
    return map;
  }

  BoardGameCompanion toCompanion(bool nullToAbsent) {
    return BoardGameCompanion(
      id: Value(id),
      numberCard: Value(numberCard),
      name: Value(name),
      description: Value(description),
      image: Value(image),
    );
  }

  factory BoardGameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardGameData(
      id: serializer.fromJson<int>(json['id']),
      numberCard: serializer.fromJson<String>(json['numberCard']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<Uint8List>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numberCard': serializer.toJson<String>(numberCard),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<Uint8List>(image),
    };
  }

  BoardGameData copyWith(
          {int? id,
          String? numberCard,
          String? name,
          String? description,
          Uint8List? image}) =>
      BoardGameData(
        id: id ?? this.id,
        numberCard: numberCard ?? this.numberCard,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
      );
  BoardGameData copyWithCompanion(BoardGameCompanion data) {
    return BoardGameData(
      id: data.id.present ? data.id.value : this.id,
      numberCard:
          data.numberCard.present ? data.numberCard.value : this.numberCard,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameData(')
          ..write('id: $id, ')
          ..write('numberCard: $numberCard, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, numberCard, name, description, $driftBlobEquality.hash(image));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardGameData &&
          other.id == this.id &&
          other.numberCard == this.numberCard &&
          other.name == this.name &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.image, this.image));
}

class BoardGameCompanion extends UpdateCompanion<BoardGameData> {
  final Value<int> id;
  final Value<String> numberCard;
  final Value<String> name;
  final Value<String> description;
  final Value<Uint8List> image;
  const BoardGameCompanion({
    this.id = const Value.absent(),
    this.numberCard = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  });
  BoardGameCompanion.insert({
    this.id = const Value.absent(),
    required String numberCard,
    required String name,
    required String description,
    required Uint8List image,
  })  : numberCard = Value(numberCard),
        name = Value(name),
        description = Value(description),
        image = Value(image);
  static Insertable<BoardGameData> custom({
    Expression<int>? id,
    Expression<String>? numberCard,
    Expression<String>? name,
    Expression<String>? description,
    Expression<Uint8List>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numberCard != null) 'number_card': numberCard,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
    });
  }

  BoardGameCompanion copyWith(
      {Value<int>? id,
      Value<String>? numberCard,
      Value<String>? name,
      Value<String>? description,
      Value<Uint8List>? image}) {
    return BoardGameCompanion(
      id: id ?? this.id,
      numberCard: numberCard ?? this.numberCard,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numberCard.present) {
      map['number_card'] = Variable<String>(numberCard.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameCompanion(')
          ..write('id: $id, ')
          ..write('numberCard: $numberCard, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TableReservationsTable tableReservations =
      $TableReservationsTable(this);
  late final $CafeClubCardTable cafeClubCard = $CafeClubCardTable(this);
  late final $BoardGameTable boardGame = $BoardGameTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tableReservations, cafeClubCard, boardGame];
}

typedef $$TableReservationsTableCreateCompanionBuilder
    = TableReservationsCompanion Function({
  Value<int> id,
  required String name,
  required int numberOfPeople,
  required int numberTable,
  required DateTime date,
  required DateTime startTime,
  required DateTime endTime,
  required String description,
});
typedef $$TableReservationsTableUpdateCompanionBuilder
    = TableReservationsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> numberOfPeople,
  Value<int> numberTable,
  Value<DateTime> date,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
  Value<String> description,
});

class $$TableReservationsTableFilterComposer
    extends Composer<_$AppDatabase, $TableReservationsTable> {
  $$TableReservationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberTable => $composableBuilder(
      column: $table.numberTable, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$TableReservationsTableOrderingComposer
    extends Composer<_$AppDatabase, $TableReservationsTable> {
  $$TableReservationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberTable => $composableBuilder(
      column: $table.numberTable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$TableReservationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TableReservationsTable> {
  $$TableReservationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get numberOfPeople => $composableBuilder(
      column: $table.numberOfPeople, builder: (column) => column);

  GeneratedColumn<int> get numberTable => $composableBuilder(
      column: $table.numberTable, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$TableReservationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TableReservationsTable,
    TableReservation,
    $$TableReservationsTableFilterComposer,
    $$TableReservationsTableOrderingComposer,
    $$TableReservationsTableAnnotationComposer,
    $$TableReservationsTableCreateCompanionBuilder,
    $$TableReservationsTableUpdateCompanionBuilder,
    (
      TableReservation,
      BaseReferences<_$AppDatabase, $TableReservationsTable, TableReservation>
    ),
    TableReservation,
    PrefetchHooks Function()> {
  $$TableReservationsTableTableManager(
      _$AppDatabase db, $TableReservationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TableReservationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TableReservationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TableReservationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> numberOfPeople = const Value.absent(),
            Value<int> numberTable = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              TableReservationsCompanion(
            id: id,
            name: name,
            numberOfPeople: numberOfPeople,
            numberTable: numberTable,
            date: date,
            startTime: startTime,
            endTime: endTime,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int numberOfPeople,
            required int numberTable,
            required DateTime date,
            required DateTime startTime,
            required DateTime endTime,
            required String description,
          }) =>
              TableReservationsCompanion.insert(
            id: id,
            name: name,
            numberOfPeople: numberOfPeople,
            numberTable: numberTable,
            date: date,
            startTime: startTime,
            endTime: endTime,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TableReservationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TableReservationsTable,
    TableReservation,
    $$TableReservationsTableFilterComposer,
    $$TableReservationsTableOrderingComposer,
    $$TableReservationsTableAnnotationComposer,
    $$TableReservationsTableCreateCompanionBuilder,
    $$TableReservationsTableUpdateCompanionBuilder,
    (
      TableReservation,
      BaseReferences<_$AppDatabase, $TableReservationsTable, TableReservation>
    ),
    TableReservation,
    PrefetchHooks Function()>;
typedef $$CafeClubCardTableCreateCompanionBuilder = CafeClubCardCompanion
    Function({
  Value<int> id,
  required String numberCard,
  required String name,
  required String phoneNumber,
});
typedef $$CafeClubCardTableUpdateCompanionBuilder = CafeClubCardCompanion
    Function({
  Value<int> id,
  Value<String> numberCard,
  Value<String> name,
  Value<String> phoneNumber,
});

class $$CafeClubCardTableFilterComposer
    extends Composer<_$AppDatabase, $CafeClubCardTable> {
  $$CafeClubCardTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));
}

class $$CafeClubCardTableOrderingComposer
    extends Composer<_$AppDatabase, $CafeClubCardTable> {
  $$CafeClubCardTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));
}

class $$CafeClubCardTableAnnotationComposer
    extends Composer<_$AppDatabase, $CafeClubCardTable> {
  $$CafeClubCardTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);
}

class $$CafeClubCardTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CafeClubCardTable,
    CafeClubCardData,
    $$CafeClubCardTableFilterComposer,
    $$CafeClubCardTableOrderingComposer,
    $$CafeClubCardTableAnnotationComposer,
    $$CafeClubCardTableCreateCompanionBuilder,
    $$CafeClubCardTableUpdateCompanionBuilder,
    (
      CafeClubCardData,
      BaseReferences<_$AppDatabase, $CafeClubCardTable, CafeClubCardData>
    ),
    CafeClubCardData,
    PrefetchHooks Function()> {
  $$CafeClubCardTableTableManager(_$AppDatabase db, $CafeClubCardTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CafeClubCardTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CafeClubCardTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CafeClubCardTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> numberCard = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
          }) =>
              CafeClubCardCompanion(
            id: id,
            numberCard: numberCard,
            name: name,
            phoneNumber: phoneNumber,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String numberCard,
            required String name,
            required String phoneNumber,
          }) =>
              CafeClubCardCompanion.insert(
            id: id,
            numberCard: numberCard,
            name: name,
            phoneNumber: phoneNumber,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CafeClubCardTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CafeClubCardTable,
    CafeClubCardData,
    $$CafeClubCardTableFilterComposer,
    $$CafeClubCardTableOrderingComposer,
    $$CafeClubCardTableAnnotationComposer,
    $$CafeClubCardTableCreateCompanionBuilder,
    $$CafeClubCardTableUpdateCompanionBuilder,
    (
      CafeClubCardData,
      BaseReferences<_$AppDatabase, $CafeClubCardTable, CafeClubCardData>
    ),
    CafeClubCardData,
    PrefetchHooks Function()>;
typedef $$BoardGameTableCreateCompanionBuilder = BoardGameCompanion Function({
  Value<int> id,
  required String numberCard,
  required String name,
  required String description,
  required Uint8List image,
});
typedef $$BoardGameTableUpdateCompanionBuilder = BoardGameCompanion Function({
  Value<int> id,
  Value<String> numberCard,
  Value<String> name,
  Value<String> description,
  Value<Uint8List> image,
});

class $$BoardGameTableFilterComposer
    extends Composer<_$AppDatabase, $BoardGameTable> {
  $$BoardGameTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));
}

class $$BoardGameTableOrderingComposer
    extends Composer<_$AppDatabase, $BoardGameTable> {
  $$BoardGameTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));
}

class $$BoardGameTableAnnotationComposer
    extends Composer<_$AppDatabase, $BoardGameTable> {
  $$BoardGameTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numberCard => $composableBuilder(
      column: $table.numberCard, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$BoardGameTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardGameTable,
    BoardGameData,
    $$BoardGameTableFilterComposer,
    $$BoardGameTableOrderingComposer,
    $$BoardGameTableAnnotationComposer,
    $$BoardGameTableCreateCompanionBuilder,
    $$BoardGameTableUpdateCompanionBuilder,
    (
      BoardGameData,
      BaseReferences<_$AppDatabase, $BoardGameTable, BoardGameData>
    ),
    BoardGameData,
    PrefetchHooks Function()> {
  $$BoardGameTableTableManager(_$AppDatabase db, $BoardGameTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BoardGameTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BoardGameTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BoardGameTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> numberCard = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<Uint8List> image = const Value.absent(),
          }) =>
              BoardGameCompanion(
            id: id,
            numberCard: numberCard,
            name: name,
            description: description,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String numberCard,
            required String name,
            required String description,
            required Uint8List image,
          }) =>
              BoardGameCompanion.insert(
            id: id,
            numberCard: numberCard,
            name: name,
            description: description,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BoardGameTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BoardGameTable,
    BoardGameData,
    $$BoardGameTableFilterComposer,
    $$BoardGameTableOrderingComposer,
    $$BoardGameTableAnnotationComposer,
    $$BoardGameTableCreateCompanionBuilder,
    $$BoardGameTableUpdateCompanionBuilder,
    (
      BoardGameData,
      BaseReferences<_$AppDatabase, $BoardGameTable, BoardGameData>
    ),
    BoardGameData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TableReservationsTableTableManager get tableReservations =>
      $$TableReservationsTableTableManager(_db, _db.tableReservations);
  $$CafeClubCardTableTableManager get cafeClubCard =>
      $$CafeClubCardTableTableManager(_db, _db.cafeClubCard);
  $$BoardGameTableTableManager get boardGame =>
      $$BoardGameTableTableManager(_db, _db.boardGame);
}
