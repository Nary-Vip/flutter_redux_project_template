import 'package:personal_pjt/models/api_book.dart';

class PushBooks {
  final int? age;
  final String? bookTitle;
  final String? authorName;
  final String? authorLastName;

  PushBooks(this.age, this.bookTitle, this.authorName, this.authorLastName);
}

class DeleteBookAction {
  final int? bookId;

  DeleteBookAction(this.bookId);
}

class GetBookForTheUsers {
  final BookInfo booksOfTheUsers;

  GetBookForTheUsers(this.booksOfTheUsers);
}

class FetchBookForTheUser {
  final String? token;

  FetchBookForTheUser(this.token);
}
