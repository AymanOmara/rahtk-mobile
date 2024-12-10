# data
```bash
 dart run build_runner build --delete-conflicting-outputs
```
# generate test coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```