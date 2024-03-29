import 'package:flutter/material.dart';
import '../profile/profile_page.dart';
import '../../core/constants/colors.dart';

import '../../core/constants/icons.dart';
import '../../pages/mahasiswa/dashboard_page.dart';
import 'jadwal_matkul_page.dart';

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

  final List<Widget> _pages = [
    const DashboardPage(),
    const JadwalMatkulPage(),
    const ProfilePage(
      role: 'Mahasiswa',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorName.primary,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.chart),
              label: 'Schedules',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.profile),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}