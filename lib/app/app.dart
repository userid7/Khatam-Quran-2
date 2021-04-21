// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatam_quran_2/counter/counter.dart';
import 'package:khatam_quran_2/l10n/l10n.dart';
import 'package:khatam_quran_2/read/view/read_page.dart';
import 'package:khatam_quran_2/report/view/report_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.green),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.green),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: DevicePreview.locale(context)!,
      builder: DevicePreview.appBuilder,
      initialRoute: '/',
      routes: {
        '/': (context) => const SafeArea(child: ReadPage()),
        '/report': (context) => const SafeArea(child: ReportPage()),
      },
    );
  }
}
