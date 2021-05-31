class Journal {
  String documentID;
  String date;
  String mood;
  String note;
  String uid;

  Journal({
    required this.documentID,
    required this.date,
    required this.mood,
    required this.note,
    required this.uid});

  factory Journal.fromDoc(dynamic doc) =>
      Journal(
          documentID: doc.documentID,
          date: doc["date"],
          mood: doc["mood"],
          note: doc["note"],
          uid: doc["uid"]
      );
}