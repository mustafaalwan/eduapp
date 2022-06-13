import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AlHassanMuhannadFirebaseUser {
  AlHassanMuhannadFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AlHassanMuhannadFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AlHassanMuhannadFirebaseUser> alHassanMuhannadFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AlHassanMuhannadFirebaseUser>(
            (user) => currentUser = AlHassanMuhannadFirebaseUser(user));
