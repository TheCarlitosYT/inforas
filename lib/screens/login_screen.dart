// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types, prefer_adjacent_string_concatenation, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/providers/secure_storage.dart';
import 'package:inforas/services/login_service.dart';
import 'package:inforas/services/usuario_service.dart';
import 'package:inforas/widgets/errorPopUp.dart';
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
  final SecureStorage secureStorage = SecureStorage();

  String _email = '';
  String _password = '';

  final LoginService loginService = new LoginService();
  final UsuarioService usuarioService = new UsuarioService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _loginError = false;

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'El Email es obligatorio'),
    EmailValidator(errorText: 'El formato del email es incorrecto'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'La contraseña es obligatoria'),
  ]);

  @override
  Widget build(BuildContext context) {
    NavigationMenuController navigationMenuController = Get.put(NavigationMenuController());
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
            _SignInButton(navigationMenuController),
            SizedBox(height: 20),
          ],
        ),
      );
  }

  MaterialButton _SignInButton(NavigationMenuController navigationMenuController) {
    return MaterialButton(
      // onPressed: () => {
      //   Get.to(() => const NavigationMenu()),
      // },
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Map<String, dynamic> data = {
            'username': '$_email',
            'password': '$_password',
          };
          loginService.login(data).then((value) {
            print('El usuario existe');
            navigationMenuController.updateSelectedIndex(0);
            Get.to(() => NavigationMenu());
            // Navigator.pushNamed(context, '/home');
          })
          .catchError((error) {
            print('Error durante el inicio de sesión $error');
            if (error is Exception && error.toString().contains('401')) {
              ErrorPopup(
                      title: 'Error en el inicio de sesión',
                      message: 'Estas credenciales no existen.')
                  .showErrorPopup(context);
              setState(() {
                _loginError = true;
              });
            } else {
              ErrorPopup(
                      title: 'Error en el inicio de sesión',
                      message: 'Error desconocido')
                  .showErrorPopup(context);
            }
          });
        } else {
          print('Not_Valid_Form_Error');
        }
      },
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