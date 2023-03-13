import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'category_entity.dart';

class CategoryContextEntity {
  final String id = const Uuid().v4();
  final String name;
  final List<CategoryEntity> subCategories;
  CategoryContextEntity({
    required this.name,
    required this.subCategories,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryContextEntity &&
        other.name == name &&
        listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode => name.hashCode ^ subCategories.hashCode;

  @override
  String toString() =>
      'CategoryContextEntity(name: $name, subCategories: $subCategories)';
}
