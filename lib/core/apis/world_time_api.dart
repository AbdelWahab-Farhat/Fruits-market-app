
import 'package:dio/dio.dart';
import 'package:fresh_fruits/core/models/time_zone_model.dart';

class WorldTimeApi {
  final String _worldTimeApi = 'https://worldtimeapi.org/api/timezone';

  Future<DateTime> fetchWorldTime() async {
    final String url = '$_worldTimeApi/Africa/Tripoli';
    final Dio dio = Dio();

    try {
      // Make the HTTP GET request and await the response
      final Response response = await dio.get(url);

      if (response.statusCode == 200) {

        final TimezoneModel timezoneModel = TimezoneModel.fromJson(response.data);
        // Return the datetime from the model
        return timezoneModel.datetime;
      } else {
        return DateTime.now(); // Return current time as fallback
      }
    } catch (e) {
      return DateTime.now(); // Return current time as fallback
    }
  }
}
