import 'package:flutter/material.dart';
import 'package:inforas/widgets/widgets.dart';

class RegisterBackground extends StatelessWidget {
  final Widget child;

  const RegisterBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _BackgroundColorRegister(),
        _Header(),
        child,
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarCustom(textImage: 'assets/logo_federas.png', text: 'Registro');
  }
}

class _BackgroundColorRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _colorBackground(Colors.white)
    );
  }

  BoxDecoration _colorBackground(Color tema) {
    return BoxDecoration(color: tema);
  }
}

