import 'package:flutter/material.dart';

class IconSocmedRegister extends StatelessWidget {
  const IconSocmedRegister({
    super.key,
    required this.imgPath,
  });

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 15,
      backgroundImage: NetworkImage(imgPath),
    );
  }
}
