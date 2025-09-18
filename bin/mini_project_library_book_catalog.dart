// Define an immutable Book
class Book {
  final String title;
  final String author;
  final int year;

  // const constructor makes Book instances immutable & canonicalizable
  const Book(this.title, this.author, this.year);

  @override
  String toString() => '"$title" by $author ($year)';
}

// Define Library Config
class LibraryConfig {
  static const String appName = 'My Library Catalog';
  static const int maxBooks = 100;
}

// Define Library Catalog
class Library {
  final List<Book> books = []; // final reference, mutable list

  void addBook(Book book) {
    if (books.length >= LibraryConfig.maxBooks) {
      print('❌ Cannot add more books. Limit reached.');
      return;
    }
    books.add(book);
    print('✅ Added: $book');
  }

  void listBooks() {
    if (books.isEmpty) {
      print('📭 No books in the catalog.');
      return;
    }
    print('📚 Library Catalog:');
    for (var book in books) {
      print('- $book');
    }
  }
}

// Main Program
void main() {
  print('Welcome to ${LibraryConfig.appName}');

  final library = Library();

  // const books
  const book1 = Book('1984', 'George Orwell', 1949);
  const book2 = Book('Brave New World', 'Aldous Huxley', 1932);

  library.addBook(book1);
  library.addBook(book2);

  library.listBooks();
}
