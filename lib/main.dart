import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_app/screen/main/main_bloc.dart';
import 'package:valyuta_app/screen/main/main_screen.dart';
import 'package:flutter_locales/flutter_locales.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'uzb', 'ru']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(builder:
        (locate) =>
        MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locate,
          theme: ThemeData(primaryColor: Colors.blue),
          home: BlocProvider(
            create: (context) => MainBloc()..add(MainCurrencyEvent()),
            child: MainScreen(),
          ),
        ));
  }
}


