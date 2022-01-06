import 'dart:async';

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

  StreamSubscription? _streamSubscription;

  Future<void> startapp() async {
    emit(
      OpinionState(documents: [], isLoading: true, errorMessage: ''),
    );

    await Future.delayed(Duration(seconds: 5));

    _streamSubscription = FirebaseFirestore.instance
        .collection('places')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        OpinionState(documents: data.docs, isLoading: false, errorMessage: ''),
      );
    })
      ..onError((error) {
        emit(
          OpinionState(
              documents: [], isLoading: false, errorMessage: error.toString()),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
