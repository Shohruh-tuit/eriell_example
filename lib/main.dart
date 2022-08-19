import 'package:example_eriell/application/auth_bloc/auth_bloc.dart';
import 'package:example_eriell/presentation/app_widget.dart';
import 'package:example_eriell/services/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(UserDataAdapter());
  }
  await Hive.openBox<UserData>('user_data');
  //

  await initializeTimerSPlash();

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return const AppWidget();
        },
      ),
    ),
  );
}

Future initializeTimerSPlash() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Future.delayed(const Duration(seconds: 2));
}
