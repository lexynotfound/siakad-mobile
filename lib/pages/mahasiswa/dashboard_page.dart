import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/widgets/menu_card.dart';
import '../../core/widgets/search_input.dart';

import '../../core/constants/images.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
        child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Perkuliahan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorName.primary,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      /*  Navigator.push(context,
                      MaterialPageRoute(builder: (context){ 
                        return const AbsensiPage();
                    })); */
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: ColorName.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: ColorName.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SearchInput(
            controller: searchController,
          ),
          const SizedBox(height: 40.0),
          MenuCard(
            label: 'Kartu Hasil Studi',
            backgroundColor: const Color(0xff686BFF),
            onPressed: () {},
            imagePath: Images.khs,
          ),
          const SizedBox(height: 40.0),
          MenuCard(
            label: 'Nilai Mata Kuliah',
            backgroundColor: const Color(0xffFFB023),
            onPressed: () {},
            imagePath: Images.nMatkul,
          ),
          const SizedBox(height: 40.0),
          MenuCard(
            label: 'Jadwal Mata Kuliah',
            backgroundColor: const Color(0xffFF68F0),
            onPressed: () {},
            imagePath: Images.jadwal,
          ),
        ],
      ),
    );
  }
}