import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:meta/meta.dart';

import '../test_usecase.dart';
import 'test_cubit.dart';

part 'other_state.dart';

@LazySingleton()
class OtherCubit extends Cubit<OtherState> with AutoResetLazySingleton {
  final TestUseCase useCase;
  OtherCubit(this.useCase) : super(OtherInitial());
  void call() {
    emit(OtherSuccess());
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}
