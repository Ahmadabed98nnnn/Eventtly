import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event.dart';

class FirebaseService {
  static CollectionReference<Event> getEventsCollection() =>
      FirebaseFirestore.instance.collection('events').withConverter(
            fromFirestore: (snapshot, options) =>
                Event.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );
  static Future<void> addEvent(Event event) async {
    CollectionReference<Event> collectionReference = getEventsCollection();
    collectionReference.doc();
    DocumentReference<Event> docReference = collectionReference.doc();
    event.id = docReference.id;
    await docReference.set(event);
  }

  static Future<List<Event>> getEvents(String categoryId) async {
    CollectionReference<Event> collectionReference = getEventsCollection();
    late QuerySnapshot<Event> querySnapshot;
    if (categoryId == '0') {
      querySnapshot = await collectionReference.orderBy('datetime').get();
    } else {
      querySnapshot = await collectionReference
          .where('categoryId', isEqualTo: categoryId)
          .orderBy('datetime')
          .get();
    }
    return querySnapshot.docs.map(
      (snapshot) {
        return snapshot.data();
      },
    ).toList();
  }
}
