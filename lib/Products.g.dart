// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Products.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Products extends _Products
    with RealmEntity, RealmObjectBase, RealmObject {
  Products({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    String? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'discountPercentage', discountPercentage);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'stock', stock);
    RealmObjectBase.set(this, 'brand', brand);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'thumbnail', thumbnail);
  }

  Products._();

  @override
  int? get id => RealmObjectBase.get<int>(this, 'id') as int?;
  @override
  set id(int? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  int? get price => RealmObjectBase.get<int>(this, 'price') as int?;
  @override
  set price(int? value) => RealmObjectBase.set(this, 'price', value);

  @override
  double? get discountPercentage =>
      RealmObjectBase.get<double>(this, 'discountPercentage') as double?;
  @override
  set discountPercentage(double? value) =>
      RealmObjectBase.set(this, 'discountPercentage', value);

  @override
  String? get rating => RealmObjectBase.get<String>(this, 'rating') as String?;
  @override
  set rating(String? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int? get stock => RealmObjectBase.get<int>(this, 'stock') as int?;
  @override
  set stock(int? value) => RealmObjectBase.set(this, 'stock', value);

  @override
  String? get brand => RealmObjectBase.get<String>(this, 'brand') as String?;
  @override
  set brand(String? value) => RealmObjectBase.set(this, 'brand', value);

  @override
  String? get category =>
      RealmObjectBase.get<String>(this, 'category') as String?;
  @override
  set category(String? value) => RealmObjectBase.set(this, 'category', value);

  @override
  String? get thumbnail =>
      RealmObjectBase.get<String>(this, 'thumbnail') as String?;
  @override
  set thumbnail(String? value) => RealmObjectBase.set(this, 'thumbnail', value);

  @override
  Stream<RealmObjectChanges<Products>> get changes =>
      RealmObjectBase.getChanges<Products>(this);

  @override
  Products freeze() => RealmObjectBase.freezeObject<Products>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Products._);
    return const SchemaObject(ObjectType.realmObject, Products, 'Products', [
      SchemaProperty('id', RealmPropertyType.int, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('price', RealmPropertyType.int, optional: true),
      SchemaProperty('discountPercentage', RealmPropertyType.double,
          optional: true),
      SchemaProperty('rating', RealmPropertyType.string, optional: true),
      SchemaProperty('stock', RealmPropertyType.int, optional: true),
      SchemaProperty('brand', RealmPropertyType.string, optional: true),
      SchemaProperty('category', RealmPropertyType.string, optional: true),
      SchemaProperty('thumbnail', RealmPropertyType.string, optional: true),
    ]);
  }
}

class Categories extends _Categories
    with RealmEntity, RealmObjectBase, RealmObject {
  Categories({
    String? name,
  }) {
    RealmObjectBase.set(this, 'name', name);
  }

  Categories._();

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Categories>> get changes =>
      RealmObjectBase.getChanges<Categories>(this);

  @override
  Categories freeze() => RealmObjectBase.freezeObject<Categories>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Categories._);
    return const SchemaObject(
        ObjectType.realmObject, Categories, 'Categories', [
      SchemaProperty('name', RealmPropertyType.string, optional: true),
    ]);
  }
}
