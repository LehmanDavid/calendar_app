import 'dart:async';
import 'dart:developer';

import 'shared/app.dart';
import 'shared/bloc/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
       await init();
        BlocOverrides.runZoned(
          () => runApp(const MainProvider()),
          blocObserver: AppBlocObserver(),
        );
      },
      (error, StackTrace stackTrace) {
        log('Error: $error');
        log('StackTrace: $stackTrace');
      },
    );
