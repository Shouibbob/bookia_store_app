import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/core/utils/themes.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_store_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_store_app/feature/intro/splash_view.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // Execute the two lines below before run
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashView(),
      ),
    );
  }
}
