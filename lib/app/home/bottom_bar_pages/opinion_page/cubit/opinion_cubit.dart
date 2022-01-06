import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'opinion_state.dart';

class OpinionCubit extends Cubit<OpinionState> {
  OpinionCubit() : super(OpinionState());
}
