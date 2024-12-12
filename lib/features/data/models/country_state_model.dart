class CountryStateModel {
  final bool error;
  final String msg;
  final List<Datum> data;

  CountryStateModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory CountryStateModel.fromJson(Map<String, dynamic> json) {
    return CountryStateModel(
      error: json["error"],
      msg: json["msg"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "msg": msg,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Datum {
  final String name;
  final String io3;
  final String io2;
  final List<State> states;

  Datum({
    required this.name,
    required this.io3,
    required this.io2,
    required this.states,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      name: json["name"],
      io3: json["io3"],
      io2: json["io2"],
      states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "io3": io3,
      "io2": io2,
      "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
  }
}

class State {
  final String name;
  final String? stateCode;

  State({required this.name, this.stateCode});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(name: json["name"], stateCode: json["stateCode"]);
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "stateCode": stateCode};
  }
}
