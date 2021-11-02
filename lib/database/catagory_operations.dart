import 'package:sqlwithforiegnkey/database/database.dart';
import 'package:sqlwithforiegnkey/modals/catagory.dart';

class CategoryOperations {
  CategoryOperations? categoryOperations;

  final dbProvider = DatabaseRepository.instance;

  createCategory(Category category) async {
    final db = await dbProvider.database;
    db!.insert('category', category.toMap());
  }

  Future<List<Category>> getAllCategories() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db!.query('category');
    List<Category> categories =
        allRows.map((category) => Category.fromMap(category)).toList();
    return categories;
  }
}
