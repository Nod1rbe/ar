import 'package:ar/features/subjects/data/models/subject_model.dart';
import 'package:ar/core/error/failures.dart';

abstract class SubjectLocalDataSource {
  Future<List<SubjectModel>> getMockSubjects();
}

class SubjectLocalDataSourceImpl implements SubjectLocalDataSource {
  @override
  Future<List<SubjectModel>> getMockSubjects() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));
      return [
        const SubjectModel(
          id: '1',
          name: 'Biologiya',
          description: 'Hujayra tuzilishi va tirik mavjudotlarni o\'rganamiz (Demo Avocado)',
          iconUrl: 'assets/tracking_images/target.jpg', // Placeholder
          modelUrl: 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF-Binary/Avocado.glb',
        ),
        const SubjectModel(
          id: '2',
          name: 'Astronomiya',
          description: 'Kosmos sirlari va sayyoralar (Demo Duck)',
          iconUrl: 'assets/tracking_images/target.jpg',
          modelUrl: 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Binary/Duck.glb',
        ),
        const SubjectModel(
          id: '3',
          name: 'Kimyo',
          description: 'Moddalar tuzilishi va ularning xossalari',
          iconUrl: 'assets/tracking_images/target.jpg',
          modelUrl: 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb',
        ),
        const SubjectModel(
          id: '4',
          name: 'Fizika',
          description: 'Tabiat qonunlari va harakat (Demo Fish)',
          iconUrl: 'assets/tracking_images/target.jpg',
          modelUrl: 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BarramundiFish/glTF-Binary/BarramundiFish.glb',
        ),
      ];
    } catch (e) {
      throw const ServerFailure('Ma\'lumotlarni olishda xatolik yuz berdi');
    }
  }
}
