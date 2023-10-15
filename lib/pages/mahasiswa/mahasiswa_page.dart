import 'package:flutter/material.dart';
import 'package:siakad_app/core/constants/colors.dart';

import '../../core/constants/icons.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorName.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.home),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.chart),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(IconName.profile),
            label: ''
          ),
        ],
      ),
    );
  }
}