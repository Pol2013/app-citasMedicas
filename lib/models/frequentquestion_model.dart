class FrequentquestionModel {
  FrequentquestionModel({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.isExpanded,
  });

  int id;
  String question;
  String answer;
  dynamic createdAt;
  dynamic updatedAt;
  bool isExpanded;

  factory FrequentquestionModel.fromJson(Map<String, dynamic> json) =>
      FrequentquestionModel(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isExpanded: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
