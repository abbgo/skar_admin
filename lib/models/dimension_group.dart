class DimensionGroup {
  final String id, name;

  DimensionGroup({required this.id, required this.name});

  factory DimensionGroup.defaultDimensionGroup() {
    return DimensionGroup(id: '', name: '');
  }

  factory DimensionGroup.fromJson(Map<String, dynamic> json) {
    return DimensionGroup(id: json['id'], name: json['name']);
  }
}
