import 'dart:io';

String readFixture({required String filePath}) {
  return File(filePath).readAsStringSync();
}
