import 'package:color_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

setAuthToken(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(authToken, value);
}
