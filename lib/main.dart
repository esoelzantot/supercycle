// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supercycle_site/core/cubits/local_cubit.dart';
import 'package:supercycle_site/core/theme/app_colors.dart';
import 'package:supercycle_site/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

          return MaterialApp(
            title: 'SuperCycle Site',
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
            home: Scaffold(body: Center(child: Text("SuperCycle Site"))),
          );
        },
      ),
    );
  }
}
