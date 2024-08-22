
class Comment {
  final String ID;
  final String customerID;
  final String customerName;
  final String content;
  final DateTime dateTime;
  Comment({
    required this.ID,
    required this.customerID,
    required this.content,
    required this.dateTime,
    required this.customerName
  });

  Map<String, dynamic> toJson() {
    return {
      "ID": ID,
      "customerID": customerID,
      "content": content,
      "dateTime": dateTime.toIso8601String(),
      "customerName" : customerName,
    };
  }
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      ID: json["ID"],
      customerID: json["customerID"],
      content: json["content"],
      dateTime: DateTime.parse(json["dateTime"],),
      customerName: json['customerName'],
    );
  }
}