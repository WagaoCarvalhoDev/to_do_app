import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/pages/notes_page.dart';
import 'presentation/theme/custom_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: CustomTheme.black,
    ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomTheme.black,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: CustomTheme.elevatedButtonStyle,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CustomTheme.black,
        ),
      ),
      home: const NotesPage(),

      /// RENOMEAR PARA NOTES
    );
  }
}
