// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types, prefer_adjacent_string_concatenation, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/widgets/widgets.dart';
import 'package:inforas/ui/input_decorations.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LogInBackground(
          child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(height: 300),
            CardContainer(
                child: Column(
              children: [
                LogInForm(),
              ],
            )),
            SizedBox(height: 20),
            // _GoogleButton(),
            SizedBox(height: 15),
            _Slider_Screen(),
          ],
        ),
      )),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  // final SecureStorage secureStorage = SecureStorage();

  String _email = '';
  String _password = '';

  // final LoginService loginService = new LoginService();
  // final ClienteService clienteService = new ClienteService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _loginError = false;

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Required_mail_error'),
    EmailValidator(errorText: 'Invalid_mail_error')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Required_password_error'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              controller: _emailController,
              decoration: InputDecorationForm.authInputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  labelTheme: Colors.black,
                  borderColor: Colors.purple,
                  prefixIcon: Icons.alternate_email),
              onChanged: (valor) => setState(() {
                _email = valor;
                _loginError = false;
                print(valor);
              }),
              validator: emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 25),
            TextFormField(
              autocorrect: false,
              obscureText: _obscureText,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              decoration: InputDecorationForm.authInputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  labelTheme: Colors.black,
                  borderColor: Colors.purple,
                  prefixIcon: Icons.key,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off))),
              onChanged: (valor) => setState(() {
                _password = valor;
                _loginError = false;
                print(valor);
              }),
              validator: passwordValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Visibility(
                visible: _loginError,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: _ForgottenPopUp()),
            _SignInButton(),
            SizedBox(height: 20),
          ],
        ),
      );
  }

  MaterialButton _SignInButton() {
    return MaterialButton(
      onPressed: () => {
        Get.to(() => const NavigationMenu())
      // Navigator.pushReplacementNamed(context, '/home');
      },
      // onPressed: () {
      //   if (_formKey.currentState!.validate()) {
      //     Map<String, dynamic> data = {
      //       'username': '$_email',
      //       'password': '$_password',
      //     };
      //     loginService.login(data).then((value) {
      //       print('El usuario existe');
      //       Navigator.pushReplacementNamed(context, '/home');
      //     }).catchError((error) {
      //       print('Error durante el inicio de sesión $error');
      //       if (error is Exception && error.toString().contains('401')) {
      //         ErrorPopup(
      //                 title: 'Log_In_Error',
      //                 message: 'Bad_Credentials_Error_Message')
      //             .showErrorPopup(context);
      //         setState(() {
      //           _loginError = true;
      //         });
      //       } else {
      //         ErrorPopup(
      //                 title: 'Log_In_Error',
      //                 message: 'Log_In_Unknown_Error')
      //             .showErrorPopup(context);
      //       }
      //     });
      //   } else {
      //     print('Not_Valid_Form_Error');
      //   }
      // },
      child: Text('Log In',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              overflow: TextOverflow.visible)),
      color: Colors.purple,
      minWidth: double.infinity,
      height: 40,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}

class _ForgottenPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/pswdRecovery');
      },
      child: Text(
        'Forgot_Password',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

// class _GoogleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ButtonGoogle(text: 'Google_Sign_In_Button');
//   }
// }

class _Slider_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: LinkToScreens(
        route: '/register',
        text: ' Regístrate aquí',
        sufixText: '¿Sin una cuenta?' + ' ',
      ),
    );
  }
}