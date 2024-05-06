// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';

// // ignore_for_file: prefer_const_constructors, sort_child_properties_last


// import 'package:inforas/providers/register_form_provider.dart';
// import 'package:inforas/services/auth_service.dart';
// import 'package:inforas/services/notification_service.dart';
// import 'package:inforas/ui/input_decorations.dart';
// import 'package:inforas/widgets/widgets.dart';
// import 'package:provider/provider.dart';

// class registerScreen extends StatelessWidget {
//   const registerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AuthBackground(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 150),
//             CardContainerReg(
//               child: 
//               Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Text("Register", style: Theme.of(context).textTheme.headlineMedium,),
//                   SizedBox(height: 30),
//                   ChangeNotifierProvider(
//                     create: (_) => RegisterFormProvider(),
//                   child: _registerForm(),
//                   ),
                  
//                 ],
//               ),
//               ),
//               SizedBox(height: 55),
//               _crearCambiarAregisterText(context),
//           ],
//         ),
//       )
//       );
//   }
// }

// class _registerForm extends StatelessWidget {
//   const _registerForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String passwd = "";
//     String passwd2 = "";
//     final registerForm = Provider.of<RegisterFormProvider>(context);
//     return Container(
//       child: Form(
//         key: registerForm.formKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Column(
//           children: [
//             TextFormField(
//               onChanged: (value) => registerForm.email = value,        
//               autocorrect: false,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecorations.authInputDecoration(
//                 hintText: 'john.doe@gmail.com',
//                 labelText: 'Email',
//                 prefixIcon: Icons.alternate_email_sharp,
                
//               ),
//               validator:(value) {
//                 String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                
//                 RegExp regExp = new RegExp(pattern);

//                 return regExp.hasMatch(value ?? '') ? null : 'Introduce un email válido';
//               },
//             ),
//             TextFormField(
//               onChanged: (value) => registerForm.password = value,
//               autocorrect: false,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecorations.authInputDecoration(
//                 hintText: '*****',
//                 labelText: 'Contraseña',
//                 prefixIcon: Icons.lock_outline,
//               ),
//               validator:(value) {
//                 passwd=value!;
//                 if (passwd==passwd2){
//                 return value.isEmpty ? 'La contraseña no debe estar vacía.' 
//                 : value.length < 6 ? 'La contraseña debe tener al menos 6 caracteres.' : null;
//                 } else {return "Las contraseñas no coinciden";}
//               },
//             ),
//             TextFormField(
//               onChanged: (value) => registerForm.password = value,
//               autocorrect: false,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecorations.authInputDecoration(
//                 hintText: '*****',
//                 labelText: 'Contraseña',
//                 prefixIcon: Icons.lock_outline,
//               ),
//               validator:(value) {
//                 passwd2=value!;
//                 if (passwd==passwd2){
//                 return value.isEmpty ? 'La contraseña no debe estar vacía.' 
//                 : value.length < 6 ? 'La contraseña debe tener al menos 6 caracteres.' : null;
//                 } else {return "Las contraseñas no coinciden";}
//               },
//             ),           
//             SizedBox(height: 40),
//             RegisterBtn(registerForm: registerForm),
//           ],
//         )
//       )
//     );
//   }
// }

// class RegisterBtn extends StatelessWidget {
//     final RegisterFormProvider registerForm;

//   RegisterBtn({Key? key, required this.registerForm}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10)),
//         disabledColor: Colors.grey,
//         elevation: 0,
//         color: Colors.deepPurple,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//           child: Text(
//             registerForm.isLoading ? 'Espere' : 'Acceder',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         onPressed: registerForm.isLoading ? null : () async {

//           FocusScope.of(context).unfocus();
//           final authService = Provider.of<AuthService>(context, listen: false);

//           if (!registerForm.isValidForm()) return;

//           registerForm.isLoading = true;

//           final String? errorMessage = await authService.createUser(registerForm.email, registerForm.password);

//           if (errorMessage == null){
//             Navigator.pushReplacementNamed(context, 'home');
//           } else {
//             print(errorMessage);
//             NotificationService.showSnackbar(errorMessage);
//             registerForm.isLoading = false;


//         }
//       }
//     );
//   }
// }


// Widget _crearCambiarAregisterText (BuildContext context){
//     return TextButton(
//     child: Text('Iniciar sesión con una cuenta existente', style: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w700,
//       fontSize: 20,
//       )
//     ),
//     onPressed: () =>
//       Navigator.pushReplacementNamed(context, 'login'),
//   );
// }



