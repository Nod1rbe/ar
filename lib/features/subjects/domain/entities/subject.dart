import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String iconUrl; // Or icon data
  final String modelUrl; // WebGLB URL

  const SubjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.modelUrl,
  });

  @override
  List<Object?> get props => [id, name, description, iconUrl, modelUrl];
}
