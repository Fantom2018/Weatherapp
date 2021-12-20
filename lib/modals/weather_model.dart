class Sky {
  late List<WeatherList> weather;
  late Main main;
  late Wind wind;
  late Sys? sys;
  late String name;
  late int cod;

  Sky(
      {required this.weather,
        required this.main,
        required this.wind,
        this.sys,
        required this.name,
        required this.cod});

  Sky.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather =[];
      json['weather'].forEach((v) {
        weather.add(WeatherList.fromJson(v));
      });
    }
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null)!;
    sys = (json['sys'] != null ? Sys.fromJson(json['sys']) : null)!;
    name = json['name'] ;
    cod = json['cod'];
  }

  get list => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['main'] = main.toJson();
    data['wind'] = wind.toJson();
    data['sys'] = sys!.toJson();
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class WeatherList {
  late String description;
  late String icon;

  WeatherList({required this.description, required this.icon});

  WeatherList.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  late double temp;
  late int pressure;
  late int humidity;

  Main({required this.temp, required this.pressure, required this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}

class Wind {
  late double speed;

  Wind({required this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    return data;
  }
}

class Sys {
  late String country;

  Sys({required this.country});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    return data;
  }
}

