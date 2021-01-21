import 'dart:io';

class AppStrings {
  static String MAPS_API_KEY = Platform.isAndroid
      ? "api_key" //android
      : "api_key"; //other os
  static String MAP_BASE_URL = "your_map_base_url";
}
