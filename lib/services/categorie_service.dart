import 'package:sim/models/models.dart';
import 'package:sim/repositories/category_repository.dart';

class CategoryService {
  final CategoryRepository _categoryRepository = CategoryRepository();
  
  List<Category> get allCategories{
   return  _categoryRepository.findAll().toList();

  }
}