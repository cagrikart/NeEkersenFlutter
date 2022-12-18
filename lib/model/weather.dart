class Weather {
  List<Result>? result;

  Weather({result});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  Result(
      {date,
      day,
      icon,
      description,
      status,
      degree,
      min,
      max,
      night,
      humidity});

  Result.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    icon = json['icon'];
    description = json['description'];
    status = json['status'];
    degree = json['degree'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day'] = day;
    data['icon'] = icon;
    data['description'] = description;
    data['status'] = status;
    data['degree'] = degree;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['humidity'] = humidity;
    return data;
  }
}
