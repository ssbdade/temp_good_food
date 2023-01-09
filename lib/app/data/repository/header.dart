import 'dart:convert';
import 'dart:developer';

import 'package:temp_good_food/app/data/repository/repositorybase.dart';

class AppToken extends Repository {
  AppToken._();

  static AppToken instance = AppToken._();

  static String uniqueToken = "";

  Map<String, String> header() {
    return {
      "Authorization": uniqueToken,
    };
  }
}
