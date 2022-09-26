import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final String gender;
  final int id;
  final String sku;
  final String stockStatus;
  final String imageUrl;
  final String url;
  final double price;

  Product({
    required this.gender,
    required this.id,
    required this.sku,
    required this.stockStatus,
    required this.imageUrl,
    required this.url,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
