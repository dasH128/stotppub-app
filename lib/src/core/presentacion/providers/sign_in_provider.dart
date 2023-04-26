import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewSigInCurrentPovider =
    StateProvider.autoDispose((ref) => ViewSigIn.signIn);

final userPovider = StateProvider<String>((ref) => 'dash128');
final passwordPovider = StateProvider<String>((ref) => 'ABC123');
final rememberUserPovider = StateProvider<bool>((ref) => false);

enum ViewSigIn { signIn, selectedTypeUser, tutorial }
