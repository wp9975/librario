import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference listBooks =
      FirebaseFirestore.instance.collection('booksInfo');

  Future<void> createBooksData(
      String tytul, String autor, int score, String uid) async {
    return await listBooks
        .doc(uid)
        .set({'name': tytul, 'gender': autor, 'score': score});
  }

  Future updateUserList(
      String name, String gender, int score, String uid) async {
    return await listBooks
        .doc(uid)
        .update({'name': name, 'gender': gender, 'score': score});
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await listBooks.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
