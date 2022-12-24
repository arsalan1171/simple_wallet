import 'package:flutter/material.dart';
import 'package:simple_wallet/routing/route_names.dart';
import 'package:simple_wallet/screens/card_screen/card_screen.dart';
import 'package:simple_wallet/screens/home_screen/home_screen.dart';
import 'package:simple_wallet/screens/inbox_screen/inbox_screen.dart';
import 'package:simple_wallet/screens/login_screen/login_screen.dart';
import 'package:simple_wallet/screens/profile_screen/profile_screen.dart';

import '../main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeScreen());

    case InboxRoute:
      return _getPageRoute(const InboxScreen());

    case CardRoute:
      return _getPageRoute(const CardScreen());

    case ProfileRoute:
      return _getPageRoute(const ProfileScreen());

    case LoginRoute:
      return _getPageRoute(LoginScreen());

    case PageControllerRoute:
      return _getPageRoute(AppPagesController());

    default:
      return _getPageRoute(const LoginScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
