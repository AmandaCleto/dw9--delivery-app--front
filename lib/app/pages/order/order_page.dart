import 'package:dw9_delivery_app/app/core/ui/baseState/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/payment_types_model.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/order/order_controller.dart';
import 'package:dw9_delivery_app/app/pages/order/order_state.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_field.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/payments_types_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final product =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;

    controller.load(product);

    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Carrinho',
                      style: context.textStyles.textTitle,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png'),
                    )
                  ],
                ),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) => state.orderProducts,
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orderProducts.length,
                    (context, index) {
                      final orderProduct = orderProducts[index].product;
                      final amount = orderProducts[index].amount;
                      return Column(
                        children: [
                          OrderProductTile(
                            index: index,
                            orderProduct: OrderProductDto(
                              amount: amount,
                              product: orderProduct,
                            ),
                          ),
                          const Divider(color: Colors.grey),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Total do pedido',
                          style: context.textStyles.textExtraBold.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          r'R$ 200.00',
                          style: context.textStyles.textExtraBold.copyWith(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10.0),
                  OrderField(
                    title: 'Endereço de entrega',
                    hintText: 'Digite um endereço',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                  ),
                  const SizedBox(height: 10.0),
                  OrderField(
                    title: 'CPF',
                    hintText: 'Digite o cpf',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                  ),
                  BlocSelector<OrderController, OrderState,
                      List<PaymentTypesModel>>(
                    selector: (state) => state.paymentTypes,
                    builder: (context, paymentTypes) {
                      return PaymentsTypesField(
                        paymentType: paymentTypes,
                      );
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DeliveryButton(
                      label: 'FINALIZAR',
                      onPressed: () {},
                      width: double.infinity,
                      height: 42.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
