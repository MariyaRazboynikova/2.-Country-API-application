class CitiesModel {
  final bool error;
  final String msg;
  final List<String> data;

  CitiesModel({required this.error, required this.msg, required this.data});

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
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
