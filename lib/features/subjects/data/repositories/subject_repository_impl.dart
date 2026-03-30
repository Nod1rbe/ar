import 'package:ar/features/subjects/data/datasources/subject_local_data_source.dart';
import 'package:ar/features/subjects/domain/entities/subject.dart';
import 'package:ar/features/subjects/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectLocalDataSource localDataSource;

  SubjectRepositoryImpl({required this.localDataSource});

  @override
  Future<List<SubjectEntity>> getSubjects() async {
    return await localDataSource.getMockSubjects();
  }
}
