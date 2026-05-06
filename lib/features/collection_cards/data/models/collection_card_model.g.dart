// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_card_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCollectionCardModelCollection on Isar {
  IsarCollection<CollectionCardModel> get collectionCardModels =>
      this.collection();
}

const CollectionCardModelSchema = CollectionSchema(
  name: r'CollectionCardModel',
  id: -2361468737503354400,
  properties: {
    r'cachedCode': PropertySchema(
      id: 0,
      name: r'cachedCode',
      type: IsarType.string,
    ),
    r'cachedImageUrl': PropertySchema(
      id: 1,
      name: r'cachedImageUrl',
      type: IsarType.string,
    ),
    r'cachedName': PropertySchema(
      id: 2,
      name: r'cachedName',
      type: IsarType.string,
    ),
    r'cardId': PropertySchema(
      id: 3,
      name: r'cardId',
      type: IsarType.string,
    ),
    r'collectionId': PropertySchema(
      id: 4,
      name: r'collectionId',
      type: IsarType.string,
    ),
    r'ownedCopies': PropertySchema(
      id: 5,
      name: r'ownedCopies',
      type: IsarType.long,
    )
  },
  estimateSize: _collectionCardModelEstimateSize,
  serialize: _collectionCardModelSerialize,
  deserialize: _collectionCardModelDeserialize,
  deserializeProp: _collectionCardModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'collectionId_cardId': IndexSchema(
      id: -6691299354559280078,
      name: r'collectionId_cardId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'collectionId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'cardId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _collectionCardModelGetId,
  getLinks: _collectionCardModelGetLinks,
  attach: _collectionCardModelAttach,
  version: '3.1.0+1',
);

int _collectionCardModelEstimateSize(
  CollectionCardModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cachedCode.length * 3;
  {
    final value = object.cachedImageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.cachedName.length * 3;
  bytesCount += 3 + object.cardId.length * 3;
  bytesCount += 3 + object.collectionId.length * 3;
  return bytesCount;
}

void _collectionCardModelSerialize(
  CollectionCardModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cachedCode);
  writer.writeString(offsets[1], object.cachedImageUrl);
  writer.writeString(offsets[2], object.cachedName);
  writer.writeString(offsets[3], object.cardId);
  writer.writeString(offsets[4], object.collectionId);
  writer.writeLong(offsets[5], object.ownedCopies);
}

CollectionCardModel _collectionCardModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CollectionCardModel();
  object.cachedCode = reader.readString(offsets[0]);
  object.cachedImageUrl = reader.readStringOrNull(offsets[1]);
  object.cachedName = reader.readString(offsets[2]);
  object.cardId = reader.readString(offsets[3]);
  object.collectionId = reader.readString(offsets[4]);
  object.isarId = id;
  object.ownedCopies = reader.readLong(offsets[5]);
  return object;
}

P _collectionCardModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _collectionCardModelGetId(CollectionCardModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _collectionCardModelGetLinks(
    CollectionCardModel object) {
  return [];
}

void _collectionCardModelAttach(
    IsarCollection<dynamic> col, Id id, CollectionCardModel object) {
  object.isarId = id;
}

extension CollectionCardModelByIndex on IsarCollection<CollectionCardModel> {
  Future<CollectionCardModel?> getByCollectionIdCardId(
      String collectionId, String cardId) {
    return getByIndex(r'collectionId_cardId', [collectionId, cardId]);
  }

  CollectionCardModel? getByCollectionIdCardIdSync(
      String collectionId, String cardId) {
    return getByIndexSync(r'collectionId_cardId', [collectionId, cardId]);
  }

  Future<bool> deleteByCollectionIdCardId(String collectionId, String cardId) {
    return deleteByIndex(r'collectionId_cardId', [collectionId, cardId]);
  }

  bool deleteByCollectionIdCardIdSync(String collectionId, String cardId) {
    return deleteByIndexSync(r'collectionId_cardId', [collectionId, cardId]);
  }

  Future<List<CollectionCardModel?>> getAllByCollectionIdCardId(
      List<String> collectionIdValues, List<String> cardIdValues) {
    final len = collectionIdValues.length;
    assert(cardIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([collectionIdValues[i], cardIdValues[i]]);
    }

    return getAllByIndex(r'collectionId_cardId', values);
  }

  List<CollectionCardModel?> getAllByCollectionIdCardIdSync(
      List<String> collectionIdValues, List<String> cardIdValues) {
    final len = collectionIdValues.length;
    assert(cardIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([collectionIdValues[i], cardIdValues[i]]);
    }

    return getAllByIndexSync(r'collectionId_cardId', values);
  }

  Future<int> deleteAllByCollectionIdCardId(
      List<String> collectionIdValues, List<String> cardIdValues) {
    final len = collectionIdValues.length;
    assert(cardIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([collectionIdValues[i], cardIdValues[i]]);
    }

    return deleteAllByIndex(r'collectionId_cardId', values);
  }

  int deleteAllByCollectionIdCardIdSync(
      List<String> collectionIdValues, List<String> cardIdValues) {
    final len = collectionIdValues.length;
    assert(cardIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([collectionIdValues[i], cardIdValues[i]]);
    }

    return deleteAllByIndexSync(r'collectionId_cardId', values);
  }

  Future<Id> putByCollectionIdCardId(CollectionCardModel object) {
    return putByIndex(r'collectionId_cardId', object);
  }

  Id putByCollectionIdCardIdSync(CollectionCardModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'collectionId_cardId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCollectionIdCardId(
      List<CollectionCardModel> objects) {
    return putAllByIndex(r'collectionId_cardId', objects);
  }

  List<Id> putAllByCollectionIdCardIdSync(List<CollectionCardModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'collectionId_cardId', objects,
        saveLinks: saveLinks);
  }
}

extension CollectionCardModelQueryWhereSort
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QWhere> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CollectionCardModelQueryWhere
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QWhereClause> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      collectionIdEqualToAnyCardId(String collectionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'collectionId_cardId',
        value: [collectionId],
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      collectionIdNotEqualToAnyCardId(String collectionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [],
              upper: [collectionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [],
              upper: [collectionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      collectionIdCardIdEqualTo(String collectionId, String cardId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'collectionId_cardId',
        value: [collectionId, cardId],
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterWhereClause>
      collectionIdEqualToCardIdNotEqualTo(String collectionId, String cardId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId],
              upper: [collectionId, cardId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId, cardId],
              includeLower: false,
              upper: [collectionId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId, cardId],
              includeLower: false,
              upper: [collectionId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'collectionId_cardId',
              lower: [collectionId],
              upper: [collectionId, cardId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CollectionCardModelQueryFilter on QueryBuilder<CollectionCardModel,
    CollectionCardModel, QFilterCondition> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cachedCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cachedCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cachedCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cachedCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cachedImageUrl',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cachedImageUrl',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cachedImageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cachedImageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cachedImageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cachedImageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cachedName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cachedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cachedName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedName',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cachedNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cachedName',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardId',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      cardIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardId',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      collectionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      ownedCopiesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownedCopies',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      ownedCopiesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownedCopies',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      ownedCopiesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownedCopies',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterFilterCondition>
      ownedCopiesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownedCopies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CollectionCardModelQueryObject on QueryBuilder<CollectionCardModel,
    CollectionCardModel, QFilterCondition> {}

extension CollectionCardModelQueryLinks on QueryBuilder<CollectionCardModel,
    CollectionCardModel, QFilterCondition> {}

extension CollectionCardModelQuerySortBy
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QSortBy> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedCode', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedCode', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedImageUrl', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedImageUrl', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedName', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCachedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedName', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByOwnedCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedCopies', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      sortByOwnedCopiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedCopies', Sort.desc);
    });
  }
}

extension CollectionCardModelQuerySortThenBy
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QSortThenBy> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedCode', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedCode', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedImageUrl', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedImageUrl', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedName', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCachedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedName', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByOwnedCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedCopies', Sort.asc);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QAfterSortBy>
      thenByOwnedCopiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedCopies', Sort.desc);
    });
  }
}

extension CollectionCardModelQueryWhereDistinct
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct> {
  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByCachedCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByCachedImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedImageUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByCachedName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByCardId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByCollectionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionCardModel, CollectionCardModel, QDistinct>
      distinctByOwnedCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownedCopies');
    });
  }
}

extension CollectionCardModelQueryProperty
    on QueryBuilder<CollectionCardModel, CollectionCardModel, QQueryProperty> {
  QueryBuilder<CollectionCardModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CollectionCardModel, String, QQueryOperations>
      cachedCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedCode');
    });
  }

  QueryBuilder<CollectionCardModel, String?, QQueryOperations>
      cachedImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedImageUrl');
    });
  }

  QueryBuilder<CollectionCardModel, String, QQueryOperations>
      cachedNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedName');
    });
  }

  QueryBuilder<CollectionCardModel, String, QQueryOperations> cardIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardId');
    });
  }

  QueryBuilder<CollectionCardModel, String, QQueryOperations>
      collectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionId');
    });
  }

  QueryBuilder<CollectionCardModel, int, QQueryOperations>
      ownedCopiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownedCopies');
    });
  }
}
