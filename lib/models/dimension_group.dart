import 'package:skar_admin/models/dimension.dart';

class DimensionGroup {
  final String id, name;
  final List<Dimension>? dimensions;

  DimensionGroup({required this.id, required this.name, this.dimensions});

  factory DimensionGroup.defaultDimensionGroup() {
    return DimensionGroup(id: '', name: '', dimensions: null);
  }

  factory DimensionGroup.fromJson(Map<String, dynamic> json) {
    return DimensionGroup(
      id: json['id'],
      name: json['name'],
      dimensions: json['dimensions'] == null
          ? []
          : List<Dimension>.from(
              json['dimensions'].map(
                (dimensionJson) => Dimension.fromJson(dimensionJson),
              ),
            ),
    );
  }
}
