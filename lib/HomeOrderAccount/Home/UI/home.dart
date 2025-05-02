import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:delivoo/Components/card_content.dart';
import 'package:delivoo/Components/custom_appbar.dart';
import 'package:delivoo/Components/reusable_card.dart';
import 'package:delivoo/HomeOrderAccount/Home/UI/Stores/stores.dart';
import 'package:delivoo/HomeOrderAccount/Home/UI/custom_delivery.dart';
import 'package:delivoo/Locale/locales.dart';
import 'package:delivoo/Routes/routes.dart';
import 'package:delivoo/Themes/colors.dart';
import 'package:delivoo/Themes/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    String? value = appLocalization.homeText;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.location_on,
              color: kMainColor,
            ),
          ),
          titleWidget: DropdownButton(
            value: value,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: kMainColor,
            ),
            iconSize: 24.0,
            elevation: 16,
            style: inputTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).secondaryHeaderColor),
            underline: Container(
              height: 0,
            ),
            onChanged: (String? newValue) {
              setState(() {
                value = newValue;
              });
              if (value == appLocalization.setLocation)
                Navigator.pushNamed(context, PageRoutes.locationPage);
            },
            items: <String?>[
              appLocalization.homeText,
              appLocalization.office,
              appLocalization.other,
              appLocalization.setLocation
            ].map<DropdownMenuItem<String>>((address) {
              return DropdownMenuItem<String>(
                value: address,
                child: Text(
                  address!,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: IconButton(
                icon: ImageIcon(
                  AssetImage('images/icons/ic_cart blk.png'),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PageRoutes.viewCart),
              ),
            ),
          ],
          hint: AppLocalizations.of(context)!.search,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.homeText1!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  AppLocalizations.of(context)!.homeText2!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          buildGrid(),
        ],
      ),
    );
  }

  Expanded buildGrid() {
    var appLocalization = AppLocalizations.of(context);
    return Expanded(
      child: FadedScaleAnimation(
        Container(
          margin: EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ReusableCard(
                cardChild: CardContent(
                  image: AssetImage(
                      'images/maincategory/vegetables_fruitsact.png'),
                  text: AppLocalizations.of(context)!.vegetableText,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StoresPage(appLocalization!.vegetable)),
                ),
              ),
              ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('images/maincategory/food_mealsact.png'),
                  text: AppLocalizations.of(context)!.foodText,
                ),
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoresPage(
                            appLocalization!.foodText!.replaceAll('\n', '')))),
              ),
              ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('images/maincategory/meat_fishact.png'),
                  text: AppLocalizations.of(context)!.meatText,
                ),
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoresPage(
                            appLocalization!.meatText!.replaceAll('\n', '')))),
              ),
              ReusableCard(
                cardChild: CardContent(
                  image:
                      AssetImage('images/maincategory/pharma_medicinesact.png'),
                  text: AppLocalizations.of(context)!.medicineText,
                ),
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoresPage(appLocalization!
                            .medicineText!
                            .replaceAll('\n', '')))),
              ),
              ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('images/maincategory/pet_suppliesact.png'),
                  text: AppLocalizations.of(context)!.petText,
                ),
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoresPage(
                            appLocalization!.petText!.replaceAll('\n', '')))),
              ),
              ReusableCard(
                cardChild: CardContent(
                  image:
                      AssetImage('images/maincategory/custom_deliveryact.png'),
                  text: AppLocalizations.of(context)!.customText,
                ),
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomDeliveryPage(
                            appLocalization!.customText!
                                .replaceAll('\n', '')))),
              ),
            ],
          ),
        ),
        durationInMilliseconds: 400,
      ),
    );
  }
}
