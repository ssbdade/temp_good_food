part of 'app_pages.dart';

abstract class Routes {
  static const ERROR = '/error';

  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.HOME + _Paths.PROFILE;
  static const SETTINGS = _Paths.SETTINGS;

  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const DETAIL = _Paths.DETAIL;
  static const DASHBOARD = _Paths.DASHBOARD;
  // static const DASHBOARD = _Paths.HOME + _Paths.DASHBOARD;

  Routes._();


  static const NOTIFICATION_PAGE = _Paths.NOTIFICATION_PAGE;
  static const MORE_PAGE = _Paths.MORE_PAGE;
  static dynamic routesArgument;

  static Future toNamed(String pageName, {arguments}) {
    print(routesArgument);
    routesArgument = arguments;
    print('routesArgument = $routesArgument');
    return Get.rootDelegate.toNamed(pageName);
  }

  static off(String pageName, {arguments}) {
    routesArgument = arguments;
    Get.rootDelegate.offNamed(pageName);
  }

  static const TEST = _Paths.TEST;
  static const SPLASH = _Paths.SPLASH;
}

/* * Routes cho app
* Dùng được để deep link
! Giá trị truyền vào giống với uri
? https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
* */

abstract class _Paths {
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const SETTINGS = '/settings';
  static const DASHBOARD = '/dashboard';
  static const NOTIFICATION_PAGE = '/notification-page';
  static const MORE_PAGE = '/more-page';
  static const DETAIL = '/detail';
  static const TEST = '/test';
  static const SPLASH = '/splash';
  static const AUTH = '/auth';
}
