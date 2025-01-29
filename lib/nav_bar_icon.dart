import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$imageName.svg',
      height: 24,
      width: 24,
      fit: BoxFit.scaleDown,
    );
  }
}
