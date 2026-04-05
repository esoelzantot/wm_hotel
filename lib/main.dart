import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/routing/router.dart';
import 'package:wm_hotel/core/services/services_locator.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ✅ الـ cubit بيتعمل مرة واحدة بس في الـ state مش في الـ build
  late final LocalCubit _localCubit;

  @override
  void initState() {
    super.initState();
    _localCubit = LocalCubit()..getSavedLang();
  }

  @override
  void dispose() {
    _localCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _localCubit,
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          final locale = state is ChangeLocalState
              ? state.locale
              : const Locale('en');

          return MaterialApp.router(
            title: 'White Moon Hotel',
            routerConfig: AppRouter.router,
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
            ),
          );
        },
      ),
    );
  }
}
