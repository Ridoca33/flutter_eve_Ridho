import 'package:flutter/material.dart';
import 'package:auth_socmed/app/data/size.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Pesanan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun',
        ),
      ],
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      iconSize: parameterGLobal.sizeFontSubHeaderCard,
      selectedFontSize: parameterGLobal.sizeFontSmall,
      unselectedFontSize: parameterGLobal.sizeFontSmall,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
