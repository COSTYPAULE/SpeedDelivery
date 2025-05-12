import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:SpeedDelivery/Locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:SpeedDelivery/Themes/colors.dart';
import 'package:SpeedDelivery/Components/bottom_bar.dart';
import 'package:SpeedDelivery/Routes/routes.dart';

List<DropdownMenuItem<String>> listDrop = [];
int? selected;
int? selected1;

void loadData() {
  listDrop = [];
  listDrop.add(DropdownMenuItem(
    child: Text('1 kg'),
    value: 'A',
  ));
  listDrop.add(DropdownMenuItem(
    child: Text('500 g'),
    value: 'B',
  ));
  listDrop.add(DropdownMenuItem(
    child: Text('250 g'),
    value: 'C',
  ));
}

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  int _itemCount = 0;
  int _itemCount1 = 0;
  int _itemCount2 = 0;

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.confirm!,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  color: Theme.of(context).cardColor,
                  child: Text(AppLocalizations.of(context)!.store!.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color(0xff616161), letterSpacing: 0.67)),
                ),
                cartOrderItemListTile(
                    context,
                    AppLocalizations.of(context)!.onion!,
                    '3.00',
                    _itemCount,
                    () => setState(() => _itemCount--),
                    () => setState(() => _itemCount++)),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                cartOrderItemListTile(
                    context,
                    AppLocalizations.of(context)!.cauliflower!,
                    '4.50',
                    _itemCount1,
                    () => setState(() => _itemCount1--),
                    () => setState(() => _itemCount1++)),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                cartOrderItemListTile(
                    context,
                    AppLocalizations.of(context)!.tomato!,
                    '2.50',
                    _itemCount2,
                    () => setState(() => _itemCount2--),
                    () => setState(() => _itemCount2++)),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 6.7,
                ),
                Container(
                  height: 53.3,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/custom/ic_instruction.png',
                        color: kDisabledColor,
                        height: 16.0,
                        width: 16.7,
                      ),
                      SizedBox(
                        width: 17.3,
                      ),
                      Text(AppLocalizations.of(context)!.instruction!,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 11.7, color: Color(0xffb2b2b2)))
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 6.7,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                  child: Text(
                      AppLocalizations.of(context)!.paymentInfo!.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: kDisabledColor)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.sub!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '\$ 10.00',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ]),
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.service!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '\$ 1.50',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ]),
                ),
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 1.0,
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.amount!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ 11.50',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 132.0,
                  color: Theme.of(context).cardColor,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 13.0, bottom: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Color(0xffc4c8c1),
                                size: 13.3,
                              ),
                              SizedBox(
                                width: 11.0,
                              ),
                              Text(AppLocalizations.of(context)!.deliver!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: kDisabledColor,
                                          fontWeight: FontWeight.bold)),
                              Text(AppLocalizations.of(context)!.homeText!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: kMainColor,
                                          fontWeight: FontWeight.bold)),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Text(
                              '1024, Central Residency Hemilton Park, New York, USA',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 11.7, color: Color(0xffb7b7b7)))
                        ],
                      ),
                    ),
                  ),
                  BottomBar(
                    text: AppLocalizations.of(context)!.pay! + " \$ 11.50",
                    onTap: () =>
                        Navigator.pushNamed(context, PageRoutes.paymentMethod),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Column cartOrderItemListTile(
    BuildContext context,
    String title,
    String price,
    int itemCount,
    Function onPressedMinus,
    Function onPressedPlus,
  ) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).secondaryHeaderColor),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 16.7,
                          ),
                          iconEnabledColor: Colors.green,
                          value: selected,
                          items: listDrop,
                          hint: Text(
                            '1 kg',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          onChanged: (dynamic value) {
                            setState(() {
                              selected = value;
                            });
                          }),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                    height: 30.0,
                    //width: 76.7,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: kMainColor),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (itemCount > 0) ? onPressedMinus as void Function()? : null,
                          child: Icon(
                            Icons.remove,
                            color: kMainColor,
                            size: 20.0,
                            //size: 23.3,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(itemCount.toString(),
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(width: 8.0),
                        InkWell(
                          onTap: onPressedPlus as void Function()?,
                          child: Icon(
                            Icons.add,
                            color: kMainColor,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ $price',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
