import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  final String _location;
  late String _time;
  final String _flag;
  final String _url;

  WorldTime(this._location, this._flag, this._url);

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse("https://worldtimeapi.org/api/timezone/$_url"));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    _time = now.toString();
  }

  String get time => _time;
}
