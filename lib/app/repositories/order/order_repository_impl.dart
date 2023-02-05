import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exceptions.dart';
import 'package:dw9_delivery_app/app/core/restClient/custom_dio.dart';
import 'package:dw9_delivery_app/app/dto/order_dto.dart';
import 'package:dw9_delivery_app/app/models/payment_types_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;
  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypesModel>> getAllPaymentTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');

      return result.data
          .map<PaymentTypesModel>((p) => PaymentTypesModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<void> savaOrders(OrderDto order) async {
    try {
      await dio.auth().post(
        '/orders',
        data: {
          'products': order.products
              .map((e) => {
                    'id': e.product.id,
                    'amount': e.amount,
                    'total_price': e.product.price,
                  })
              .toList(),
          'user_id': "#userAuthRef",
          'address': order.address,
          'CPF': order.document,
          'payment_method_id': order.paymentMethodId,
        },
      );
    } on DioError catch (e, s) {
      log('Erro ao registrar produtos', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao registrar produtos');
    }
  }
}
