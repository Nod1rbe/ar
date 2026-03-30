import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar/core/usecases/usecase.dart';
import 'package:ar/features/subjects/domain/usecases/get_subjects.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_state.dart';
import 'package:ar/core/error/failures.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final GetSubjects getSubjects;

  SubjectCubit({required this.getSubjects}) : super(SubjectInitial());

  Future<void> loadSubjects() async {
    emit(SubjectLoading());
    try {
      final subjects = await getSubjects(NoParams());
      emit(SubjectLoaded(subjects: subjects));
    } catch (e) {
      if (e is Failure) {
        emit(SubjectError(message: e.message));
      } else {
        emit(const SubjectError(message: 'Noma\'lum xatolik yuz berdi'));
      }
    }
  }
}
