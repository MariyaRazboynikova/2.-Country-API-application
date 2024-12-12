class CityModel {
  final bool error;
  final String msg;
  final List<String> data;

  CityModel({required this.error, required this.msg, required this.data});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      error: json["error"],
      msg: json["msg"],
      data: List<String>.from(json["data"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "msg": msg,
      "data": List<dynamic>.from(data.map((x) => x)),
    };
  }
}
