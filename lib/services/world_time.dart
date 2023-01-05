import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  final String _location;
  late String _time;
  final String _flag;
  final String _url;
  late bool _isDaytime;

  WorldTime(this._location, this._flag, this._url);

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$_url"));
      Map data = jsonDecode(response.body);
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      _isDaytime = now.hour > 6 && now.hour < 20;
      _time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      _time = "Could not get time data";
      _isDaytime = false;
    }
  }

  String get time => _time;

  String get location => _location;

  String get flag => _flag;

  bool get isDaytime => _isDaytime;
}
