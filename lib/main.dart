import 'package:SpeedDelivery/HomeOrderAccount/Account/UI/ListItems/settings_page.dart';
import 'package:SpeedDelivery/Locale/locales.dart';
import 'package:SpeedDelivery/Routes/routes.dart';
import 'package:SpeedDelivery/firebase/firebase_init.dart';
import 'package:SpeedDelivery/language_cubit.dart';
import 'package:SpeedDelivery/map_utils.dart';
import 'package:SpeedDelivery/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp(); 
  
  MapUtils.getMarkerPic();
  runApp(Phoenix(child: SpeedDelivery()));
  MobileAds.instance.initialize();
}

class SpeedDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit()
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) {
              return MaterialApp(
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en'),
                  const Locale('ar'),
                  const Locale('fr'),
                  const Locale('id'),
                  const Locale('pt'),
                  const Locale('es'),
                  const Locale('es'),
                  const Locale('tr'),
                  const Locale('it'),
                  const Locale('sw'),
                ],
                locale: locale,
                theme: theme,
                home: Settings(),
                routes: PageRoutes().routes(),
              );
            },
          );
        },
      ),
    );
  }
}
