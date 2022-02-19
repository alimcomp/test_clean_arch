import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_clean_arch/main.dart';
import 'package:test_clean_arch/test_usecase.dart';

import 'other_cubit.dart';

part 'test_state.dart';

@LazySingleton()
class TestCubit extends Cubit<TestState> with AutoResetLazySingleton {
  final TestUseCase useCase;
  final OtherCubit cubit;
  TestCubit(
    this.useCase,
    this.cubit,
  ) : super(TestInitial()) {
    cubit.stream.listen((event) {
      print(event);
    });
  }

  increase() {
    print(cubit.state);
    emit(TestSuccess(useCase.call()));
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}

mixin AutoResetLazySingleton<S> on Cubit<S> {
  @override
  Future<void> close() {
    if (getIt.isRegistered<Cubit<S>>(instance: this)) {
      getIt.resetLazySingleton<Cubit<S>>(instance: this);
    }
    return super.close();
  }
}
