import 'package:ar/core/usecases/usecase.dart';
import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:ar/features/subjects/domain/repositories/subject_repository.dart';

class GetSubjects implements UseCase<List<SubjectEntity>, NoParams> {
  final SubjectRepository repository;

  GetSubjects(this.repository);

  @override
  Future<List<SubjectEntity>> call(NoParams params) async {
    return await repository.getSubjects();
  }
}
