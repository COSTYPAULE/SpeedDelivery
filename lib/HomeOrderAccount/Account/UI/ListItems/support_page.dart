import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:delivoo/Components/bottom_bar.dart';
import 'package:delivoo/Components/entry_field.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(AppLocalizations.of(context)!.support!,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 48.0),
                  color: Theme.of(context).cardColor,
                  child: FadedScaleAnimation(
                    Image(
                      image: AssetImage(
                          "images/logos/logo_user.png"), //delivoo logo
                      height: 130.0,
                      width: 99.7,
                    ),
                    durationInMilliseconds: 400,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 16.0),
                        child: Text(
                          AppLocalizations.of(context)!.orWrite!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                        child: Text(
                          AppLocalizations.of(context)!.yourWords!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      EntryField(
                        image: 'images/icons/ic_phone.png',
                        label: AppLocalizations.of(context)!.mobileNumber,
                        initialValue: number,
                        readOnly: true,
                      ),
                      EntryField(
                        image: 'images/icons/ic_mail.png',
                        label: AppLocalizations.of(context)!.message,
                        hint: AppLocalizations.of(context)!.enterMessage,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                BottomBar(
                  text: AppLocalizations.of(context)!.submit,
                  onTap: () {
                    /*............*/
                  },
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
