import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewSigInCurrentPovider = StateProvider((ref) => ViewSigIn.signIn);
final userType = StateProvider((ref) => 'admin');
final userPovider = StateProvider((ref) => 'dash128');
final passwordPovider = StateProvider((ref) => 'dash128');

enum ViewSigIn { signIn, selectedTypeUser, tutorial }
