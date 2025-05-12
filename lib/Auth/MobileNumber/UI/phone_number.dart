import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:SpeedDelivery/Auth/MobileNumber/UI/mobile_input.dart';
import 'package:SpeedDelivery/Auth/login_navigator.dart';
import 'package:SpeedDelivery/Locale/locales.dart';
import 'package:SpeedDelivery/Themes/colors.dart';
import 'package:flutter/material.dart';

//first page that takes phone number as input for verification
class PhoneNumber extends StatefulWidget {
  static const String id = 'phone_number';

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          //used for scrolling when keyboard pops up
          child: Container(
            color: Theme.of(context).cardColor,
            height: MediaQuery.of(context).size.height * 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                FadedScaleAnimation(
                  Image.asset(
                    "images/logos/logo_user.png",
                    scale: 4, //SpeedDelivery logo
                  ),
                  durationInMilliseconds: 400,
                ),
                Spacer(),
                Image.asset(
                  "images/logos/Delivery.gif", //footer image
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: MobileInput(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 32.0,
                    color: Theme.of(context).cardColor,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.or!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginRoutes.socialLogin),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Color(0xff3a559f),
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          'images/ic_login_facebook.png',
                          height: 19.0,
                          width: 19.7,
                        ),
                        SizedBox(
                          width: 34.0,
                        ),
                        Text(AppLocalizations.of(context)!.continueWith!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kWhiteColor)),
                        Text(AppLocalizations.of(context)!.facebook!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.bold)),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginRoutes.socialLogin),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: kWhiteColor,
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset('images/ic_login_google.png',
                            height: 19.0, width: 19.7),
                        SizedBox(
                          width: 34.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.continueWith!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kMainTextColor),
                        ),
                        Text(AppLocalizations.of(context)!.google!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kMainTextColor)),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginRoutes.socialLogin),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Color(0xff000000),
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset('images/ic_login_apple.png',
                            height: 19.0, width: 19.7),
                        SizedBox(
                          width: 34.0,
                        ),
                        Text(AppLocalizations.of(context)!.continueWith!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kWhiteColor)),
                        Text(AppLocalizations.of(context)!.apple!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.bold)),
                        Spacer(),
                      ],
                    ),
                  ),
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
