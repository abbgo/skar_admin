class Dimension {
  final String id, dimension;

  Dimension({required this.id, required this.dimension});

  factory Dimension.defaultDimension() {
    return Dimension(id: '', dimension: '');
  }

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(id: json['id'], dimension: json['dimension']);
  }
}
