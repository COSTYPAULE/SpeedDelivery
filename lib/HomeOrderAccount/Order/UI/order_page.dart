import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:delivoo/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:delivoo/Themes/colors.dart';
import 'package:delivoo/Themes/style.dart';
import 'package:delivoo/HomeOrderAccount/Home/UI/order_placed_map.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(AppLocalizations.of(context)!.orderText!,
                style: Theme.of(context).textTheme.bodyLarge),
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderMapPage(
                  pageTitle: AppLocalizations.of(context)!.vegetable,
                ),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 51.0,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  color: Theme.of(context).cardColor,
                  child: Text(
                    AppLocalizations.of(context)!.process!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color(0xff99a596),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: FadedScaleAnimation(
                        Image.asset(
                          'images/maincategory/vegetables_fruitsact.png',
                          scale: 5,
                        ),
                        durationInMilliseconds: 400,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.vegetable!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '20 June, 11:35am',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 11.7, color: Color(0xffc1c1c1)),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.pickup!,
                              style: orderMapAppBarTextStyle.copyWith(
                                  color: kMainColor),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              '\$ 11.50 | ${AppLocalizations.of(context)!.paypal}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 11.7,
                                      letterSpacing: 0.06,
                                      color: Color(0xffc1c1c1)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Icon(
                        Icons.location_on,
                        color: kMainColor,
                        size: 13.3,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.store! + '\t',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10.0,
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(Union Market)',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.0, letterSpacing: 0.05),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Icon(
                        Icons.navigation,
                        color: kMainColor,
                        size: 13.3,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.homeText!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10.0,
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\t(Central Residency)',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.0, letterSpacing: 0.05),
                    ),
                  ],
                ),
                Container(
                  height: 51.0,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  color: Theme.of(context).cardColor,
                  child: Text(
                    AppLocalizations.of(context)!.past!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color(0xff99a596),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: FadedScaleAnimation(
                        Image.asset(
                          'images/maincategory/vegetables_fruitsact.png',
                          scale: 5,
                        ),
                        durationInMilliseconds: 400,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.of(context)!.vegetable!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '20 June, 11:35am',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 11.7, color: Color(0xffc1c1c1)),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.deliv!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              '\$ 11.50 | ${AppLocalizations.of(context)!.credit}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 11.7,
                                      letterSpacing: 0.06,
                                      color: Color(0xffc1c1c1)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Icon(
                        Icons.location_on,
                        color: kMainColor,
                        size: 13.3,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.store! + '\t',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10.0,
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(Union Market)',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.0, letterSpacing: 0.05),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, PageRoutes.rate),
                        child: Text(
                          AppLocalizations.of(context)!.rate!,
                          style: orderMapAppBarTextStyle.copyWith(
                              color: kMainColor),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Icon(
                        Icons.navigation,
                        color: kMainColor,
                        size: 13.3,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.homeText!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10.0,
                          letterSpacing: 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\t(Central Residency)',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.0, letterSpacing: 0.05),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1,
                ),
                if (_anchoredBanner != null)
                  Container(
                    width: _anchoredBanner!.size.width.toDouble(),
                    height: _anchoredBanner!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredBanner!),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
