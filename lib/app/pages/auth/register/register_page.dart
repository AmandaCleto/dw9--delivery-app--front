import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cadastro', style: context.textStyles.textTitle),
                Text(
                  'Preencha os campos abaixo para criar o seu cadastro.',
                  style: context.textStyles.textMedium.copyWith(fontSize: 18.0),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirma senha',
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: DeliveryButton(
                    label: 'CADASTRAR',
                    width: double.infinity,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
