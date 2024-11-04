// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_sync_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetLastSyncModelCollection on Isar {
  IsarCollection<int, LastSyncModel> get lastSyncModels => this.collection();
}

const LastSyncModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'LastSyncModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'type',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'timestamp',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, LastSyncModel>(
    serialize: serializeLastSyncModel,
    deserialize: deserializeLastSyncModel,
    deserializeProperty: deserializeLastSyncModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeLastSyncModel(IsarWriter writer, LastSyncModel object) {
  IsarCore.writeString(writer, 1, object.type);
  IsarCore.writeLong(
      writer, 2, object.timestamp.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
LastSyncModel deserializeLastSyncModel(IsarReader reader) {
  final object = LastSyncModel();
  object.id = IsarCore.readId(reader);
  object.type = IsarCore.readString(reader, 1) ?? '';
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      object.timestamp =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.timestamp =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  return object;
}

@isarProtected
dynamic deserializeLastSyncModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _LastSyncModelUpdate {
  bool call({
    required int id,
    String? type,
    DateTime? timestamp,
  });
}

class _LastSyncModelUpdateImpl implements _LastSyncModelUpdate {
  const _LastSyncModelUpdateImpl(this.collection);

  final IsarCollection<int, LastSyncModel> collection;

  @override
  bool call({
    required int id,
    Object? type = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (type != ignore) 1: type as String?,
          if (timestamp != ignore) 2: timestamp as DateTime?,
        }) >
        0;
  }
}

sealed class _LastSyncModelUpdateAll {
  int call({
    required List<int> id,
    String? type,
    DateTime? timestamp,
  });
}

class _LastSyncModelUpdateAllImpl implements _LastSyncModelUpdateAll {
  const _LastSyncModelUpdateAllImpl(this.collection);

  final IsarCollection<int, LastSyncModel> collection;

  @override
  int call({
    required List<int> id,
    Object? type = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties(id, {
      if (type != ignore) 1: type as String?,
      if (timestamp != ignore) 2: timestamp as DateTime?,
    });
  }
}

extension LastSyncModelUpdate on IsarCollection<int, LastSyncModel> {
  _LastSyncModelUpdate get update => _LastSyncModelUpdateImpl(this);

  _LastSyncModelUpdateAll get updateAll => _LastSyncModelUpdateAllImpl(this);
}

sealed class _LastSyncModelQueryUpdate {
  int call({
    String? type,
    DateTime? timestamp,
  });
}

class _LastSyncModelQueryUpdateImpl implements _LastSyncModelQueryUpdate {
  const _LastSyncModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<LastSyncModel> query;
  final int? limit;

  @override
  int call({
    Object? type = ignore,
    Object? timestamp = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (type != ignore) 1: type as String?,
      if (timestamp != ignore) 2: timestamp as DateTime?,
    });
  }
}

extension LastSyncModelQueryUpdate on IsarQuery<LastSyncModel> {
  _LastSyncModelQueryUpdate get updateFirst =>
      _LastSyncModelQueryUpdateImpl(this, limit: 1);

  _LastSyncModelQueryUpdate get updateAll =>
      _LastSyncModelQueryUpdateImpl(this);
}

class _LastSyncModelQueryBuilderUpdateImpl
    implements _LastSyncModelQueryUpdate {
  const _LastSyncModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<LastSyncModel, LastSyncModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? type = ignore,
    Object? timestamp = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (type != ignore) 1: type as String?,
        if (timestamp != ignore) 2: timestamp as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension LastSyncModelQueryBuilderUpdate
    on QueryBuilder<LastSyncModel, LastSyncModel, QOperations> {
  _LastSyncModelQueryUpdate get updateFirst =>
      _LastSyncModelQueryBuilderUpdateImpl(this, limit: 1);

  _LastSyncModelQueryUpdate get updateAll =>
      _LastSyncModelQueryBuilderUpdateImpl(this);
}

extension LastSyncModelQueryFilter
    on QueryBuilder<LastSyncModel, LastSyncModel, QFilterCondition> {
  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension LastSyncModelQueryObject
    on QueryBuilder<LastSyncModel, LastSyncModel, QFilterCondition> {}

extension LastSyncModelQuerySortBy
    on QueryBuilder<LastSyncModel, LastSyncModel, QSortBy> {
  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> sortByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> sortByTypeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension LastSyncModelQuerySortThenBy
    on QueryBuilder<LastSyncModel, LastSyncModel, QSortThenBy> {
  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> thenByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> thenByTypeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension LastSyncModelQueryWhereDistinct
    on QueryBuilder<LastSyncModel, LastSyncModel, QDistinct> {
  QueryBuilder<LastSyncModel, LastSyncModel, QAfterDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastSyncModel, LastSyncModel, QAfterDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension LastSyncModelQueryProperty1
    on QueryBuilder<LastSyncModel, LastSyncModel, QProperty> {
  QueryBuilder<LastSyncModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LastSyncModel, String, QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LastSyncModel, DateTime, QAfterProperty> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension LastSyncModelQueryProperty2<R>
    on QueryBuilder<LastSyncModel, R, QAfterProperty> {
  QueryBuilder<LastSyncModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LastSyncModel, (R, String), QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LastSyncModel, (R, DateTime), QAfterProperty>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension LastSyncModelQueryProperty3<R1, R2>
    on QueryBuilder<LastSyncModel, (R1, R2), QAfterProperty> {
  QueryBuilder<LastSyncModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<LastSyncModel, (R1, R2, String), QOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<LastSyncModel, (R1, R2, DateTime), QOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
