import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/Provider/state_Provider.dart';

final getNotifierProvider  = StateNotifierProvider<ApiStateNotifier,PostState>((ref) {
  return ApiStateNotifier();
});