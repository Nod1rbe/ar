import 'package:equatable/equatable.dart';
import 'package:ar/features/subjects/domain/entities/subject.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object> get props => [];
}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  final List<SubjectEntity> subjects;

  const SubjectLoaded({required this.subjects});

  @override
  List<Object> get props => [subjects];
}

class SubjectError extends SubjectState {
  final String message;

  const SubjectError({required this.message});

  @override
  List<Object> get props => [message];
}
