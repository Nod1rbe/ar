import 'package:ar/features/subjects/domain/entities/subject.dart';

abstract class SubjectRepository {
  Future<List<SubjectEntity>> getSubjects();
}
