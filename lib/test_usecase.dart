import 'package:injectable/injectable.dart';

class TestUseCase {
  final TestRepository testRepository;

  TestUseCase(this.testRepository);

  String call() {
    return 'test usecase';
  }
}

abstract class TestRepository {
  String getVersion();
}

@Injectable(as: TestRepository)
class TestRepositoryImpl extends TestRepository {
  @override
  String getVersion() {
    return 'version';
  }
}

@module
abstract class RegisterModule {
  TestUseCase get testUseCase;
}
