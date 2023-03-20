import 'package:fluent_ui/fluent_ui.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
      ),
      home: const HomePage(),
    );
  }
}
