part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestSuccess extends TestState {
  final String version;

  TestSuccess(this.version);
}
