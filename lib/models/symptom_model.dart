class SymptomModel {
  SymptomModel({
    this.id,
    this.diseaseId,
    this.descripcion,
    this.value,
  });

  int id;
  int diseaseId;
  String descripcion;
  int value;

  factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
        id: json["id"],
        diseaseId: json["disease_id"],
        descripcion: json["descripcion"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "disease_id": diseaseId,
        "descripcion": descripcion,
        "value": value,
      };
}
