import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:delivoo/Components/bottom_bar.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:delivoo/Routes/routes.dart';
import 'package:delivoo/Themes/colors.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.2,
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(60.0),
                  child: FadedScaleAnimation(
                    Image.asset(
                      'images/order_placed.png',
                      height: 265.7,
                      width: 260.7,
                    ),
                    durationInMilliseconds: 400,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.placed!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 23.3),
                ),
                Text(
                  AppLocalizations.of(context)!.thanks!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: kDisabledColor),
                ),
                Spacer(
                  flex: 2,
                ),
                BottomBar(
                  text: AppLocalizations.of(context)!.orderText,
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.orderPage),
                )
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
