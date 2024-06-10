// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:inforas/services/usuario_service.dart';
import 'package:inforas/ui/input_decorations.dart';
import 'package:inforas/widgets/errorPopUp.dart';
import 'package:inforas/widgets/succesPopUp.dart';
// import 'package:inforas/widgets/errorPopUp.dart';
import 'package:inforas/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: RegisterBackground(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(height: 295),
              CardContainer(
                  child: Column(
                children: [
                  RegisterForm(),
                ],
              )),
              SizedBox(height: 20),
              // _GoogleButton(),
              SizedBox(height: 15),
              _Slider_Screen(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _nombre = '';
  String _apellidos = '';
  String _password = '';
  String _passwordConfirm = '';

  final UsuarioService usuarioService = new UsuarioService();

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextRepeat = true;

  final nameValidator = MultiValidator([
    RequiredValidator(
        errorText:
            'El nombre es obligatorio.'), 
    MaxLengthValidator(30,
        errorText: 'El nombre es demasiado largo') 
  ]);

  final surnameValidator = MultiValidator([
    RequiredValidator(
        errorText:
             "El apellido es obligatorio."),
    MaxLengthValidator(50,
        errorText: 'El nombre es demasiado largo') 
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(
        errorText:
            'Email obligatorio.'),
    EmailValidator(
        errorText: 'El formato del email no es correcto.'), 
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(
        errorText:
            'Contraseña obligatoria.'),
    MinLengthValidator(6,
        errorText: 'Contraseña demasiado corta.'), 
    PatternValidator(r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
        errorText:
             'Formato de contraseña inválido (Debe contener al menos un número y un caracter especial)'), 
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                controller: _nombreController,
                decoration: InputDecorationForm.authInputDecoration(
                    hintText: 'Nombre', 
                    labelText: 'Nombre', 
                    labelTheme: Colors.black,
                    borderColor: Colors.purple,
                    prefixIcon: Icons.person),
                onChanged: (valor) => setState(() {
                  _nombre = valor;
                  print(_nombre);
                }),
                validator: nameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                controller: _apellidosController,
                decoration: InputDecorationForm.authInputDecoration(
                    hintText: 'Apellidos', 
                    labelText: 'Apellidos',
                    labelTheme: Colors.black,
                    borderColor: Colors.purple,
                    prefixIcon: Icons.person),
                onChanged: (valor) => setState(() {
                  _apellidos = valor;
                  print(_apellidos);
                }),
                validator: surnameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                controller: _emailController,
                decoration: InputDecorationForm.authInputDecoration(
                    hintText: 'Ejemplo: juan@gmail.com',
                    labelText: 'Correo Electrónico',
                    labelTheme: Colors.black,
                    borderColor: Colors.purple,
                    prefixIcon: Icons.alternate_email),
                onChanged: (valor) => setState(() {
                  _email = valor;
                  print(_email);
                }),
                validator: emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: _obscureText,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.black),
                controller: _passwordController,
                onChanged: (valor) => setState(() {
                  _password = valor;
                  print(_password);
                }),
                decoration: InputDecorationForm.authInputDecoration(
                  hintText: '********',
                  labelText: 'Contraseña', //Texto contraseña
                  labelTheme: Colors.black,
                  borderColor: Colors.purple,
                  prefixIcon: Icons.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: _obscureTextRepeat,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.black),
                controller: _repeatPasswordController,
                onChanged: (valor) => setState(() {
                  _passwordConfirm = valor;
                  print(_passwordConfirm);
                }),
                decoration: InputDecorationForm.authInputDecoration(
                  hintText: '********',
                  labelText: 'Repetir Contraseña', //Contraseña
                  labelTheme: Colors.black,
                  borderColor: Colors.purple,
                  prefixIcon: Icons.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextRepeat
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextRepeat = !_obscureTextRepeat;
                      });
                    },
                  ),
                ),
                validator: (valor) =>
                    MatchValidator(errorText: 'La contraseña no coincide')
                        .validateMatch(_passwordConfirm, _password),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 25),
              _SignUpButton()
            ],
          )),
    );
  }

  MaterialButton _SignUpButton() {
    return MaterialButton(
      // onPressed: () {Navigator.pushNamed(context, '/login');},
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Map<String, dynamic> data = {
            'username': '$_email',
            'password': '$_password',
            'nombre': '$_nombre',
            'apellidos': '$_apellidos',
          };
          print('Contraseñas hacen Match');
          usuarioService.registerClient(data).then((value) {
            print('Usuario creado correctamente');
            SuccessPopup(title: 'Se ha creado la cuenta correctamente')
                .showSuccessPopup(context);
            Navigator.pushNamed(context, '/login');
          }).catchError((error) {
            print('Error, usuario no creado $error');
            if (usuarioService.clientUsername
                .any((client) => client.username != _email)) {
              ErrorPopup(
                title: 'Account_not_Created_error', //Error al crear la cuenta
                message: 'Try_again_later_error', //Try again later
              ).showErrorPopup(context);
            } else {
              ErrorPopup(
                title: 'Account_not_Created_error',
                message: 'Email_already_exists_error', //Correo ya existe
              ).showErrorPopup(context);
            }
          });
        } else {
          print('El formulario no es válido');
        }
      },
      child: Text('Registrate', //Registrarse
          style: TextStyle(
              color: Color(0xffededed),
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

// class _GoogleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           child: ButtonGoogle(text: 'Google_Sign_Up_Button'),
//         );
//       },
//     );
//   }
// }

class _Slider_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Container(
        child: LinkToScreens(
          route: '/login',
          text: ' Iniciar sesión',
          sufixText: '¿Tienes una cuenta?' + ' ',
        ),
      ),
    );
  }
}
