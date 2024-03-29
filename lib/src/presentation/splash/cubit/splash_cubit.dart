import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'splash_state.dart';
part 'splash_cubit.freezed.dart';


class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void load() async {
    emit(const SplashState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(const SplashState.loaded());
    
  }
}