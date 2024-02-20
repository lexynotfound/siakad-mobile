import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import 'package:siakad_app/data/datasources/auth_local_datasources.dart';
import 'package:siakad_app/pages/auth/auth_page.dart';
import 'package:siakad_app/pages/mahasiswa/mahasiswa_page.dart';
import '../../pages/auth/splash_page.dart';
import 'bloc/khs/khs_bloc.dart';
import 'bloc/schedules/schedules_bloc.dart';
import 'bloc/qrcode/qrcode_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KhsBloc(),
        ),
        BlocProvider(
          create: (context) => SchedulesBloc(),
        ),
        BlocProvider(
          create: (context) => QrcodeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDataSource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return const MahasiswaPage();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
