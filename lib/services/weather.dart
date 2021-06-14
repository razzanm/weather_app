import 'location.dart';
import 'networking.dart';

const apikey = '2796ec23a3ee597fdea2257fd86a76ec';
String openwweatherapilink = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$openwweatherapilink?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkingHelper.getdata();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    var jsondecodeddata;
    locate curlocation = locate();
    await curlocation.getCurrentlocation();
    try {
      NetworkingHelper netwworkhelper = NetworkingHelper(
          url:
              '$openwweatherapilink?lat=${curlocation.latitude}&lon=${curlocation.longitude}&appid=$apikey&units=metric');
      jsondecodeddata = await netwworkhelper.getdata();
    } catch (e) {
      return null;
    }
    return (jsondecodeddata);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
