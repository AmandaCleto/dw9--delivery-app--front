import 'package:dw9_delivery_app/app/core/config/env/env.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: DeliveryButton(
                onPressed: () {},
                label: 'ACESSAR',
                height: 35.0,
                width: context.percentWidth(0.6),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: context.screenWidth,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
