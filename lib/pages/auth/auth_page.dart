import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              width: 115.0,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "SIAKAD",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: ColorName.primary,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Yang Terbaik",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorName.grey,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0
          ),
        child: Column(
          mainAxisAlignment: MainAxisSize.min,
          children: [
            Button.filled(
              onPressed:(){
                showModalBottomSheet(
                  context: context, 
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context){
                    return LoginBottomSheet(
                      onPressed(){
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context)
                            => const DosenPage(),
                            ),
                        );
                      },
                    );
                  },
                );
              },
              label: 'CIVITAS AKADEMIK'
            ),
            const SizedBox(height: 8.0),
            Button.outlined(
              onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context){
                    return LoginBottomSheet(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const MahasiswaPage(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              label: 'MAHASISWA',
            ),
            const SizedBox(height: 32.0),
            const Text.rich(
              TextSpan(
                text: "Dengan memilih salah satu, Anda Menyetujuinnya",
                children: [
                  TextSpan(
                    text: 'Ketentuan Layanan & Kebijakan Privasi',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorName.primary,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 12,
                color: ColorName.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        ),
    );
  }
}