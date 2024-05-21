import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/category_entity.dart';
import 'package:domain/features/product/entity/product_entity.dart';

abstract interface class IProductRepository{

  Future<Result<List<ProductEntity>, NetworkException>> getProducts();

  Future<Result<List<CategoryEntity>, NetworkException>> getCategories();
}