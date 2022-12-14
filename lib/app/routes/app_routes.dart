part of 'app_pages.dart';

abstract class Routes {
  static const ERROR = '/error';

  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.HOME + _Paths.PROFILE;
  static const SETTINGS = _Paths.SETTINGS;
  static const DATABASE = _Paths.DATABASE;

  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const CUSTOMER = _Paths.CUSTOMER;
  static const STATS = _Paths.STATS;
  static const SIGNUP = _Paths.SIGNUP;
  static const DETAIL = _Paths.DETAIL;
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
  static const ALERT = _Paths.ALERT;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const MYCOUNTRY_STATS = _Paths.MYCOUNTRY_STATS;
  static const GLOBAL_STATS = _Paths.GLOBAL_STATS;
  static const DRAWER = _Paths.DRAWER;
  static const CUSTOMER_MANAGER = _Paths.CUSTOMER_MANAGER;
  static const DAILY_REPORT_MANAGER = _Paths.DAILY_REPORT_MANAGER;
  static const SERVICE_MANAGER = _Paths.SERVICE_MANAGER;
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
  static const STATS = '/stats';
  static const ALERT = '/alert';
  static const MYCOUNTRY_STATS = '/mycountry-stats';
  static const GLOBAL_STATS = '/global-stats';
  static const DATABASE = '/database_manager';
  static const CUSTOMER = '/customer';
  static const DRAWER = '/drawer';
  static const CUSTOMER_MANAGER = '/customer_manager';
  static const DAILY_REPORT_MANAGER = '/daily_report_manager';
  static const SERVICE_MANAGER = '/service_manager';
}
