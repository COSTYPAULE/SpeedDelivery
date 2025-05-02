import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:delivoo/Routes/routes.dart';
import 'package:delivoo/Themes/colors.dart';
import 'package:delivoo/Themes/style.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wallet!,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        titleSpacing: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {/*......*/},
          ),
        ],
      ),
      body: FadedSlideAnimation(
        Wallet(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!
                        .availableBalance!
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        letterSpacing: 0.67,
                        color: kHintColor,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '\$ 258.50',
                    style: listTitleTextStyle.copyWith(
                        fontSize: 35.0, color: kMainColor, letterSpacing: 0.18),
                  ),
                ),
              ),
            ),
            Container(
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Theme.of(context).cardColor,
              child: Text(
                AppLocalizations.of(context)!.recent!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.store!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      Text('30 June 2018, 11.59 am',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\$21.00',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffe32a2a)),
                      ),
                      SizedBox(height: 10.0),
                      Text('3 items',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 3.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.store!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      Text('30 June 2018, 11.59 am',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\$15.20',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffe32a2a)),
                      ),
                      SizedBox(height: 10.0),
                      Text('2 items',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 3.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.store!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      Text('30 June 2018, 11.59 am',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\$10.50',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffe32a2a)),
                      ),
                      SizedBox(height: 10.0),
                      Text('1 item',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 3.0,
            ),
          ],
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          top: 70.0,
          end: 20.0,
          child: Container(
            height: 46.0,
            width: 134.0,
            color: kMainColor,
            child: TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.addMoney),
              child: Text(
                AppLocalizations.of(context)!.addMoney!,
                style: bottomBarTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                backgroundColor: kMainColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
