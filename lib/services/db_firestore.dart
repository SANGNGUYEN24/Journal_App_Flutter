import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ch13_local_persistence/models/journal.dart';
import 'db_firestore_api.dart';

class DbFirestoreService implements DbApi{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _collectionJournals = 'journals';

  DbFirestoreService(){
    _firestore.settings;
  }

  Stream<List<Journal>> getJournalList(String uid){
    return _firestore.collection

  }
}

