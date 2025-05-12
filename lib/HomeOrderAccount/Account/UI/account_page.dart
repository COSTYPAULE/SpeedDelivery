import 'package:SpeedDelivery/Components/list_tile.dart';
import 'package:SpeedDelivery/Locale/locales.dart';
import 'package:SpeedDelivery/Routes/routes.dart';
import 'package:SpeedDelivery/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.account!,
            style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: Account(),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserDetails(),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 8.0,
        ),
        AddressTile(),
        BuildListTile(
          image: 'images/account/ic_menu_wallet.png',
          text: AppLocalizations.of(context)!.wallet,
          onTap: () => Navigator.pushNamed(context, PageRoutes.wallet),
        ),
        BuildListTile(
            image: 'images/account/ic_menu_tncact.png',
            text: AppLocalizations.of(context)!.tnc,
            onTap: () => Navigator.pushNamed(context, PageRoutes.tncPage)),
        BuildListTile(
            image: 'images/account/ic_menu_supportact.png',
            text: AppLocalizations.of(context)!.support,
            onTap: () => Navigator.pushNamed(context, PageRoutes.supportPage,
                arguments: number)),
        BuildListTile(
          image: 'images/account/ic_menu_setting.png',
          text: AppLocalizations.of(context)!.settings,
          onTap: () => Navigator.pushNamed(context, PageRoutes.settings),
        ),
        LogoutTile(),
      ],
    );
  }
}

class AddressTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
        image: 'images/account/ic_menu_addressact.png',
        text: AppLocalizations.of(context)!.saved,
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.savedAddressesPage);
        });
  }
}

class LogoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
      image: 'images/account/ic_menu_logoutact.png',
      text: AppLocalizations.of(context)!.logout,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.loggingOut!),
                content: Text(AppLocalizations.of(context)!.areYouSure!),
                actions: <Widget>[
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.no!),
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: kMainColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kTransparentColor)),
                    ),
                  ),
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.yes!),
                      style: TextButton.styleFrom(
                        backgroundColor: kMainColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kTransparentColor)),
                      ),
                      onPressed: () {
                        Phoenix.rebirth(context);
                      })
                ],
              );
            });
      },
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\n' + 'Samantha Smith',
              style: Theme.of(context).textTheme.bodyLarge),
          Text('\n' + '+1 987 654 3210',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Color(0xff9a9a9a))),
          SizedBox(
            height: 5.0,
          ),
          Text('samanthasmith@mail.com',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Color(0xff9a9a9a))),
        ],
      ),
    );
  }
}
