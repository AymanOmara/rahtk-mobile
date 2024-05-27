import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/products/mapper/category_mapper.dart';
import 'package:data/features/products/mapper/product_mapper.dart';
import 'package:data/features/products/model/category_model.dart';
import 'package:data/features/products/model/product_model.dart';
import 'package:data/features/products/request/add_to_favorite_request.dart';
import 'package:data/features/products/request/get_all_products_request.dart';
import 'package:data/features/products/request/get_favorites_request.dart';
import 'package:data/features/products/request/get_product_details.dart';
import 'package:data/features/products/request/remove_favorite_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
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
  Future<Result<List<ProductEntity>, NetworkException>> getProducts() async{
    var result = await _service.fetchData<List<ProductModel>>(
      GetAllProductsRequest(),
      data: ProductsModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<ProductEntity>, NetworkException>> getFavorites() async {
    var result = await _service.fetchData<List<ProductModel>>(
      GetFavoritesRequest(),
      data: ProductsModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<ProductEntity>, NetworkException>> addToFavorite(
      int productId) async {
    var result = await _service.fetchData<ProductModel>(
      AddToFavoriteRequest(productId: productId),
      data: ProductModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<ProductEntity>, NetworkException>> removeFavorite(
      int productId) async {
    var result = await _service.fetchData<ProductModel>(
      RemoveFavoriteRequest(productId: productId),
      data: ProductModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<ProductEntity>, NetworkException>> getProductDetails(
    int productId,
  ) async {
    var result = await _service.fetchData<ProductModel>(
      GetProductDetails(productId: productId),
      data: ProductModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
