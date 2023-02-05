import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_field.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:dw9_delivery_app/app/pages/order/widgets/payments_types_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) {
                return Column(
                  children: [
                    OrderProductTile(
                      index: index,
                      orderProduct: OrderProductDto(
                        amount: 10,
                        product: ProductModel(
                          description: '',
                          id: 1,
                          name: 'passo',
                          image:
                              'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
                          price: 12.2,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                  ],
                );
              },
            ),
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
                const PaymentsTypesField(),
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
    );
  }
}
