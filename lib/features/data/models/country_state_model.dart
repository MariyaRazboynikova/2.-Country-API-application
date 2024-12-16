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
  final String iso3;
  final String iso2;
  final List<State> states;

  Datum({
    required this.name,
    required this.iso3,
    required this.iso2,
    required this.states,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      name: json["name"],
      iso3: json["iso3"],
      iso2: json["iso2"],
      states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "iso3": iso3,
      "iso2": iso2,
      "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
  }
}

class State {
  final String name;
  final String? stateCode;

  State({required this.name, this.stateCode});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(name: json["name"], stateCode: json["state_code"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "state_code": stateCode};
  }
}
