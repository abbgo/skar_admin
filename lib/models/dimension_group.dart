import 'package:equatable/equatable.dart';
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

class ResultDimensionGroup extends Equatable {
  final List<DimensionGroup>? dimensionGroups;
  final String error;

  const ResultDimensionGroup({this.dimensionGroups, required this.error});

  factory ResultDimensionGroup.defaultResult() {
    return const ResultDimensionGroup(dimensionGroups: null, error: '');
  }

  @override
  List<Object?> get props => [dimensionGroups, error];
}
