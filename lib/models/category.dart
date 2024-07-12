import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Category extends Equatable {
  final String id, nameTM, nameRU;
  final String? parentCategoryID;
  final List<Category>? childCategories;
  bool isChecked = false;

  Category({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    this.parentCategoryID,
    this.childCategories,
  });

  factory Category.defaultCategory() {
    return Category(
      id: '',
      nameTM: '',
      nameRU: '',
      parentCategoryID: null,
      childCategories: null,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      parentCategoryID: json['parent_category_id'] ?? '',
      childCategories: json['child_categories'] == null
          ? []
          : List<Category>.from(
              json['child_categories'].map(
                (categoryJson) => Category.fromJson(categoryJson),
              ),
            ),
    );
  }

  @override
  List<Object?> get props =>
      [id, nameTM, nameRU, parentCategoryID, childCategories];
}

class ResultCategory extends Equatable {
  final List<Category>? categories;
  final String error;

  const ResultCategory({this.categories, required this.error});

  factory ResultCategory.defaultResult() {
    return const ResultCategory(categories: null, error: '');
  }

  @override
  List<Object?> get props => [categories, error];
}
