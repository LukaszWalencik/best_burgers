import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit()
      : super(
          const AccountState(user: null),
        );

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }
}
