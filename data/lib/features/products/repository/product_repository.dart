import 'package:data/features/products/mapper/category_mapper.dart';
import 'package:data/features/products/model/category_model.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/category_entity.dart';
import 'package:domain/features/product/entity/product_entity.dart';
import 'package:domain/features/product/repository/i_product_repository.dart';

import '../request/get_categories_request.dart';

class ProductRepository implements IProductRepository {
  final IAPIService _service;

  ProductRepository(this._service);

  @override
  Future<Result<List<CategoryEntity>, NetworkException>> getCategories() async {
    var result = await _service.fetchData<List<CategoryModel>>(
      GetCategoriesRequest(),
      data: CategoryModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.toEntity() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<ProductEntity>, NetworkException>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
