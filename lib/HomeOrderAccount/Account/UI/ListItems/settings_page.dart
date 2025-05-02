import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:delivoo/Components/bottom_bar.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:delivoo/Routes/routes.dart';
import 'package:delivoo/Themes/colors.dart';
import 'package:delivoo/Themes/style.dart';
import 'package:delivoo/language_cubit.dart';
import 'package:delivoo/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeList {
  final String? title;
  final String? subtitle;

  ThemeList({this.title, this.subtitle});
}

class LanguageList {
  final String? title;

  LanguageList({this.title});
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late LanguageCubit _languageCubit;
  late ThemeCubit _themeCubit;
  String? selectedLocal;
  String? selectedTheme;

  final List<String> language = [
    'English',
    'عربى',
    'français',
    'bahasa Indonesia',
    'português',
    'Español',
    'italiano',
    'Türk',
    'Kiswahili'
  ];

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<ThemeList> themes = <ThemeList>[
      ThemeList(
        title: AppLocalizations.of(context)!.darkMode,
        subtitle: AppLocalizations.of(context)!.darkText,
      ),
      ThemeList(
        title: AppLocalizations.of(context)!.lightMode,
        subtitle: AppLocalizations.of(context)!.lightText,
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(AppLocalizations.of(context)!.settings!,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
        titleSpacing: 0.0,
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 57.7,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //color: kCardBackgroundColor,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.display!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: themes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: themes[index].title!,
                      title: Text(
                        themes[index].title!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        themes[index].subtitle!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      groupValue: selectedTheme,
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedTheme = value;
                        });
                      },
                    );
                  },
                ),
                Container(
                  height: 58.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.selectLanguage!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: language.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: language[index],
                      groupValue: selectedLocal,
                      title: Text(
                        language[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLocal = value;
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
              physics: BouncingScrollPhysics(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                  text: AppLocalizations.of(context)!.continueText,
                  onTap: () {
                    if (selectedLocal == 'English') {
                      _languageCubit.selectLanguage('en');
                    } else if (selectedLocal == 'عربى') {
                      _languageCubit.selectLanguage('ar');
                    } else if (selectedLocal == 'português') {
                      _languageCubit.selectLanguage('pt');
                    } else if (selectedLocal == 'français') {
                      _languageCubit.selectLanguage('fr');
                    } else if (selectedLocal == 'Español') {
                      _languageCubit.selectLanguage('es');
                    } else if (selectedLocal == 'bahasa Indonesia') {
                      _languageCubit.selectLanguage('id');
                    } else if (selectedLocal == 'italiano') {
                      _languageCubit.selectLanguage('it');
                    } else if (selectedLocal == 'Türk') {
                      _languageCubit.selectLanguage('tr');
                    } else if (selectedLocal == 'Kiswahili') {
                      _languageCubit.selectLanguage('sw');
                    }
                    if (selectedTheme == 'Dark Mode') {
                      _themeCubit.selectTheme(darkTheme);
                    } else {
                      _themeCubit.selectTheme(appTheme);
                    }
                    Navigator.pushNamed(context, PageRoutes.loginNavigator);
                  }),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
