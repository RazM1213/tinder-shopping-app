// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      gender: json['gender'] as String,
      id: json['id'] as int,
      sku: json['sku'] as String,
      stockStatus: json['stock_status'] as String,
      imageUrl: json['image_url'] as String,
      url: json['url'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'gender': instance.gender,
      'id': instance.id,
      'sku': instance.sku,
      'stock_status': instance.stockStatus,
      'image_url': instance.imageUrl,
      'url': instance.url,
      'price': instance.price,
    };
