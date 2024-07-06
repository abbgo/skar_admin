class Category {
  final String id, nameTM, nameRU;

  Category({required this.id, required this.nameTM, required this.nameRU});

  factory Category.defaultCategory() {
    return Category(id: '', nameTM: '', nameRU: '');
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
    );
  }
}
