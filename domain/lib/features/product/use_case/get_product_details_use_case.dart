import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/product_entity.dart';
import 'package:domain/features/product/repository/i_product_repository.dart';

class GetProductDetailsUseCase {
  final IProductRepository _productRepository;

  const GetProductDetailsUseCase(this._productRepository);

  Future<Result<Response<ProductEntity>, NetworkException>> call(
    int productId,
  ) async {
    return await _productRepository.getProductDetails(productId);
  }
}
