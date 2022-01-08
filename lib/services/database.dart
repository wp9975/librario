import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librario/models/books.dart';

class DatabaseService {
  // FirebaseFirestore? _instance;

  // List<Books> _books = [];

  // List<Books> getBooks() {
  //   return _books;
  // }

  // DatabaseService({required this.uid});

  final CollectionReference listBooks =
      FirebaseFirestore.instance.collection('books_data');

  // Future<void> createBooksData(
  //     String tytul, String autor, int pdfUrl, String uid) async {
  //   return await listBooks
  //       .doc(uid)
  //       .set({'Tytuł': tytul, 'Autor': autor, 'URL': pdfUrl});
  // }

  // Future updateBooksList(
  //     String tytul, String autor, int pdfUrl, String uid) async {
  //   return await listBooks
  //       .doc(uid)
  //       .update({'Tytuł': tytul, 'Autor': autor, 'URL': pdfUrl});
  // }

  Future getBooksList() async {
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

  Stream<QuerySnapshot> get books_data {
    return listBooks.snapshots();
  }

// List<Book> _booksListFromSnapshot(QuerySnapshot snapshot) {
//   return snapshot.docs.map((doc) {
//     //print(doc.data);
//     return Book(
//         tytul: doc.data['tytul'] ?? '',
//         autor: doc.data['autor'] ?? 0,
//         pdfUrl: doc.data['pdfUrl'] ?? '0');
//   }).toList();
//
}
