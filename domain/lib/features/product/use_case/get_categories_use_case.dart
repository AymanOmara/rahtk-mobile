import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/category_entity.dart';
import 'package:domain/features/product/repository/i_product_repository.dart';

class GetCategoriesUseCase {
  final IProductRepository _repository;

  const GetCategoriesUseCase(this._repository);

  Future<Result<List<CategoryEntity>, NetworkException>> call() async {
    return await _repository.getCategories();
  }
}
