part of 'opinion_cubit.dart';

@immutable
class OpinionState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const OpinionState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
