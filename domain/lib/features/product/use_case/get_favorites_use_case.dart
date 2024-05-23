import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/product_entity.dart';
import 'package:domain/features/product/repository/i_product_repository.dart';

class GetFavoritesUseCase{
  final IProductRepository _productRepository;
  GetFavoritesUseCase(this._productRepository);
  Future<Result<List<ProductEntity>, NetworkException>> call()async{
    return await _productRepository.getFavorites();
  }
}