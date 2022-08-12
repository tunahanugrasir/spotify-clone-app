// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) => GenreModel(
      title: json['title'] as String?,
      imageURL: json['imageURL'] as String?,
      backgroundColor: (json['backgroundColor'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );
