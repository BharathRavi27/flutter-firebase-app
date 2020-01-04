import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;
  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserdata(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
