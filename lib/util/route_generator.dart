import 'package:donor/ui/pages/picker_info.dart';
import 'package:donor/ui/pages/show_photo.dart';
import 'package:donor/ui/pages/sign.dart';
import 'package:donor/util/fade_route.dart';
import 'package:donor/ui/pages/about.dart';
import 'package:donor/ui/pages/chat.dart';
import 'package:donor/ui/pages/tabs/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: RouteSettings(
            name: '/',
            isInitialRoute: true,
          ),
          builder: (_) => HomePage(),
        );
      case '/signin':
        return FadeRoute(
          settings: RouteSettings(
            name: '/signin',
            isInitialRoute: false,
          ),
          page: SignInPage(),
        );
      case '/chat':
        return FadeRoute(
          settings: RouteSettings(
            name: '/chat',
            isInitialRoute: false,
          ),
          page: ChatPage(),
        );
      case '/picker_info':
        if (args is String)
          return FadeRoute(
            settings: RouteSettings(
              name: '/picker_info',
              isInitialRoute: false,
            ),
            page: PickerInfoPage(args),
          );
        return _errorRoute();
      case '/show_photo':
        if (args is Map)
          return FadeRoute(
            settings: RouteSettings(
              name: '/show_photo',
              isInitialRoute: false,
            ),
            page: ShowPhotoPage(args),
          );
        return _errorRoute();
      case '/about':
        return FadeRoute(
          settings: RouteSettings(
            name: '/about',
            isInitialRoute: false,
          ),
          page: AboutPage(),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error', isInitialRoute: false),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('NOT FOUND'),
          ),
          body: Center(
            child: Text('ROUTE NOT FOUND'),
          ),
        );
      },
    );
  }
}
