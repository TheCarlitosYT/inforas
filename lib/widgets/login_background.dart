import 'package:flutter/material.dart';
import 'package:inforas/widgets/widgets.dart';

class LogInBackground extends StatelessWidget {

  final Widget child;

  const LogInBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _colorBackground(Colors.white),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Header(),
          this.child,
        ],
      ),
    );
  }
  BoxDecoration _colorBackground(Color tema) {
    return BoxDecoration(color: tema);
  }
}



class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarCustom(textImage: 'assets/logo_federas.png', text: 'LogIn');
  }
}