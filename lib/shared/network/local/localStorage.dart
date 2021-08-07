import 'package:shared_preferences/shared_preferences.dart';

Future<bool> savetoke({
  required String key,
  required dynamic value,
}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return await sharedPreferences.setString(key, value);
}

getData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get("token");
}

deleteData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.remove("token");
}
