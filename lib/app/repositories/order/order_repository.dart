import 'package:dw9_delivery_app/app/dto/order_dto.dart';

import '../../models/payment_types_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypesModel>> getAllPaymentTypes();
  Future<void> savaOrders(OrderDto order);
}
