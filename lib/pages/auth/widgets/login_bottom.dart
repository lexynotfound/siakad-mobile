import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import 'package:siakad_app/data/datasources/auth_local_datasources.dart';
import 'package:siakad_app/data/models/request/auth_request_model.dart';
import 'package:siakad_app/pages/dosen/dosen_page.dart';
import 'package:siakad_app/pages/mahasiswa/mahasiswa_page.dart';

import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/constants/colors.dart';

class LoginBottomSheet extends StatefulWidget{
  // final VoidCallback onPressed;
  const LoginBottomSheet({
    super.key,
    // required this.onPressed,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet>{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleTapOutside(){
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTapOutside,
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          left: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 40.0),
              ],
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Masukkan username dan password agar bisa mengakses informasi administrasi.",
                  style: TextStyle(
                    color: ColorName.grey,
                  ),
                ),
                const SizedBox(height: 50.0),
                CustomTextField(
                  controller: usernameController,
                  label: 'Email',
                ),
                const SizedBox(height: 12.0),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state){
                    state.maybeWhen(
                      orElse: (){},
                      loaded: (data){
                        AuthLocalDataSource().saveAuthData(data);
                        if(data.user.roles == 'mahasiswa'){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const MahasiswaPage();
                          }));
                        } else {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const DosenPage();
                          }));
                        }
                      },
                      /* error: (message){
                        showDialog(
                          context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: Text(message),
                            );
                          }
                        );
                      }, */
                      // Di dalam BlocListener yang menangani kesalahan
                      error: (message) {
                        Navigator.pop(context); // Tutup modal terlebih dahulu
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior
                                  .floating, // Agar dapat di-custom
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Sesuaikan dengan radius yang Anda inginkan
                              ),
                              backgroundColor: ColorName.danger,
                              content: Text('Error - $message'),
                            ),
                          );
                        });
                      },
                    );
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Button.filled(
                            onPressed: () {
                              final model = AuthRequestModel(
                                  email: usernameController.text,
                                  password: passwordController.text);
                              context
                                  .read<LoginBloc>()
                                  .add(LoginEvent.login(model));
                            },
                            label: 'Masuk',
                          );
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}