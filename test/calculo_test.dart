import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('test', () {
    var data = 'C:\\Users\\munho\\Downloads\\nubank-2023-03-amor.csv';
    var dateString = RegExp(r'[0-9]{4}-[0-9]{2}').firstMatch(data)!.group(0);
    var dateTime = DateFormat('yyyy-MM').parse(dateString!);

    expect(dateTime, isA<DateTime>());
    expect(dateTime.year, 2023);
    expect(dateTime.month, 3);
  });
}
