import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class SideMenuDrawer extends StatelessWidget {

  _onAccountDetailsTap(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/account_details');
  }

  _onTutorialStart(BuildContext context){
    Navigator.pop(context);
    Navigator.pushNamed(context, '/start_tutorial');
  }

  _onSupportTap(BuildContext context){
    Navigator.pop(context);
    Navigator.pushNamed(context, '/support');
  }

  _onSettingsTap(BuildContext context){
    Navigator.pop(context);
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('username'),
            accountEmail: Text('user@fra-uas.de'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[700],
              radius: 52.0,
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")))),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(AppLocalization.of(context).accountdetails),
            onTap: () => _onAccountDetailsTap(context),
           ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(AppLocalization.of(context).starttutorial),
            onTap: () => _onTutorialStart(context),
           ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(AppLocalization.of(context).support),
            onTap: () => _onSupportTap(context),
           ),
          //spacer
          Expanded(
            child: Container(),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              AppLocalization.of(context).settings,
            ),
            onTap: () => _onSettingsTap(context),
          ),
        ],
      ),
    );
  }
}
