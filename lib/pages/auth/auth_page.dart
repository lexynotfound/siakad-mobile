import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import '../../pages/auth/widgets/login_bottom.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../core/widgets/buttons.dart';

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
              Images.logos,
              width: 135.0,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "IDS",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: ColorName.primary,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorName.grey,
              ),
            ),
          ],
        ),
      ),
      /* floatingActionButton: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: (){},
            error: (message) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error - $message'),
                  ),
                );
              });
            },
          );
        },
      ), */
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button.filled(
              onPressed:(){
                showModalBottomSheet(
                  context: context, 
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context){
                    return BlocProvider(
                      create: (context) => LoginBloc(),
                      child: const LoginBottomSheet(),
                      // onPressed: (){
                      //   Navigator.pop(context);
                      //   Navigator.pushReplacement(
                      //     context, 
                      //     MaterialPageRoute(
                      //       builder: (context)
                      //       => const DosenPage(),
                      //       ),
                      //   );
                      // },
                    );
                  },
                );
              },
              label: 'Login'
            ),
            const SizedBox(height: 32.0),
            const Text.rich(
              TextSpan(
                text: "Dengan memilih salah satu, Anda Menyetujuinya",
                children: [
                  TextSpan(
                    text: ' Ketentuan Layanan & Kebijakan Privasi',
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