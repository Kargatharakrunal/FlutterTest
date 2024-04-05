import 'package:realm/realm.dart';

part 'Products.g.dart';

@RealmModel()
class _Products{
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  String? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;

}

@RealmModel()
class _Categories{
  String? name;
}

