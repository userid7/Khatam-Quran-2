// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khatam_quran_2/app/app.dart';
import 'package:khatam_quran_2/app/app_bloc_observer.dart';
import 'package:khatam_quran_2/hive/models/hive_quran_model.dart';
import 'package:khatam_quran_2/hive/services/hive_history_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_quran_repository.dart';
import 'package:khatam_quran_2/hive/services/hive_surahlist_repository.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getExternalStorageDirectory();
  Hive.init('${appDocumentDir!.path}/hive_dir');
  await Hive.deleteFromDisk();

  print(appDocumentDir.path);
  // var file = await dirContents(appDocumentDir);
  // file.forEach((element) {
  //   print(element.toString());
  // });

  // await Hive.initFlutter();
  // Hive..init(directory!.path);
  Hive.registerAdapter<QuranModel>(QuranModelAdapter());
  final quranBox = HiveQuranRepository();
  final historyBox = HiveHistoryRepository();
  final surahListBox = HiveSurahListRepository();

  await quranBox.init();
  await historyBox.init();
  await surahListBox.init();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const App(), // Wrap your app
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}
