import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'opinion_state.dart';

class OpinionCubit extends Cubit<OpinionState> {
  OpinionCubit()
      : super(OpinionState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));
}
