import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not exist: ${file.absolute}");
      }
      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      print("error readJournals: $e");
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$json');
  }

  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}

class Database {
  List<Journal> journal;

  Database({required this.journal});

  // Retrieve and map the JSON objects to a List<Journal>
  factory Database.fromJson(Map<String, dynamic> json) => Database(
        journal: List<Journal>.from(
            json["journals"].map((x) => Journal.fromJson(x))),
      );

  // Convert the Journal class into a JSON object
  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
      };
}

class Journal {
  late String id;
  late String date;
  late String mood;
  late String note;

  Journal({
    required this.id,
    required this.date,
    required this.mood,
    required this.note,
  });

  // Convert the JSON object to a Journal class
  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
      id: json["id"],
      date: json["date"],
      mood: json["modd"],
      note: json["note"]);

  // Convert the Journal class to a JSON object
  Map<String, dynamic> toJson()=>{
    "id": id,
    "date": date,
    "mood": mood,
    "note": note,
  };
}

// Responsible for passing the action and a journal entry between pages
class JournalEdit{
  // Passes an action to 'Save' or 'Cancel', editing an  entry
  late String action;

  // Passes the journal entry values
  late Journal journal;
  JournalEdit({
    required this.action,
    required this.journal,
});


}
