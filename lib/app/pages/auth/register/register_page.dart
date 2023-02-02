import 'package:dw9_delivery_app/app/core/ui/baseState/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao cadastrar um usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cadastro', style: context.textStyles.textTitle),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style:
                        context.textStyles.textMedium.copyWith(fontSize: 18.0),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: Validatorless.required("Nome Obrigatório"),
                    controller: _nameEC,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required("Email Obrigatório"),
                      Validatorless.email('E-mail inválido'),
                    ]),
                    controller: _emailEC,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha Obrigatória"),
                      Validatorless.min(
                        6,
                        'Senha deve conter ao menos 6 caracteres',
                      ),
                    ]),
                    obscureText: true,
                    controller: _passwordEC,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required("Confirmar Senha Obrigatório"),
                      Validatorless.compare(
                        _passwordEC,
                        'As senha é diferente da confirmação',
                      ),
                    ]),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirma senha',
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: DeliveryButton(
                      label: 'CADASTRAR',
                      width: double.infinity,
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;

                        if (valid) {
                          controller.register(
                            _nameEC.text,
                            _emailEC.text,
                            _passwordEC.text,
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
