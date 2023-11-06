import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import 'package:siakad_app/data/datasources/auth_local_datasources.dart';
import 'package:siakad_app/pages/auth/auth_page.dart';
import 'package:siakad_app/pages/mahasiswa/mahasiswa_page.dart';
import '../../pages/auth/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* debugShowCheckedModeBanner: false, */
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: AuthLocalDataSource().isLogin(),
        builder:(context, snapshot){
          if(snapshot.hasData && snapshot.data!){
            
            return const MahasiswaPage();
          }
          return const AuthPage();
        },
      ),
      /* home: BlocProvider(
        create: (context) => LoginBloc(),
        child: const SplashPage(),
      ), */
    );
  }
}
