import 'dart:io';

class Book {
  String? _name;
  String? _author;
  double? _rate;

  Book([this._name, this._author, this._rate]);

  static List info = <Book>[
    Book('dart', 'ali', 4.8),
    Book('html', 'alex', 2.1),
    Book('css', 'ahmed', 4.9),
  ];

  static void Display_all_books() {
    if (info.isEmpty) {
      print("there is no Books");
    } else {
      print("Book name\t\t\tBook author\t\t\tRate");
      info.forEach((element) {
        print(
            "${element._name}\t\t\t\t${element._author}\t\t\t\t${element._rate}");
      });
    }
  }

  static void Display_books_with_rate_plus_4() {
    info.forEach((element) {
      if (element._rate > 4.0) {
        print("${element._name}\t\t\t${element._author}\t\t\t${element._rate}");
      }
    });
  }

  static void Add_book() {
    print("Enter Book Name: ");
    String? name = stdin.readLineSync();

    print("Enter Book author: ");
    String? author = stdin.readLineSync();

    print("Enter Book rate: ");
    var rate = stdin.readLineSync()!;
    var doublerate = double.parse(rate);

    List<Book> myli = <Book>[Book(name, author, doublerate)];
    info.addAll(myli);
  }

  static void Update_book() {
    print("type the book you want to update");
    String? conf = stdin.readLineSync();
    info.forEach((element) {
      if (conf == element._name) {
        print("rename the book name: ");
        element._name = stdin.readLineSync();

        print("rename the author");
        element._author = stdin.readLineSync();

        print("rewrite the rate");
        element._rate = double.parse(stdin.readLineSync()!);
      }
    });
  }

  static void Delete_book() {
    print("type the name of book you want to delete");
    String? con = stdin.readLineSync();
    info.removeWhere((element) => con == element._name);
    print("done!");
  }

  static void Search_book() {
    print("type the book you want to search for: ");
    String? query = stdin.readLineSync()!;
    info.forEach((element) {
      if (element._name.contains(query)) {
        print("Book name\t\t\tBook author\t\t\tRate");
        print(
            "${element._name}\t\t\t\t${element._author}\t\t\t\t${element._rate}");
      }
    });
  }
}

main() {
  print('''Main menu
1- Display all books
2- Display books with rate +4.
3- Add book
4- Update book
5- Delete book
6- Search
Write your choice:''');

  String? ch = stdin.readLineSync();

  if (ch == '1') {
    Book.Display_all_books();
  } else if (ch == '2') {
    Book.Display_books_with_rate_plus_4();
  } else if (ch == '3') {
    Book.Add_book();
  } else if (ch == '4') {
    Book.Update_book();
  } else if (ch == '5') {
    Book.Delete_book();
  } else if (ch == '6') {
    Book.Search_book();
  }
}

