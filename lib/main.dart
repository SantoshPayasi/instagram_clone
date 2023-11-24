// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/cridentials/cridential_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/user_cubit.dart';
import 'package:instagram_clone/features/presentation/pages/Search/search_screen.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signIn_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/features/presentation/pages/main/main_screen.dart';
import 'package:instagram_clone/firebase_options.dart';
import "package:instagram_clone/route_controller.dart";
import 'features/presentation/cubit/user/getSIngleUser/cubit/get_single_user_cubit.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>())
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                }
                return const SigninPage();
              },
            );
          }
        },
        // home: const MainScreen()
        // home: const SigninPage(),
      ),
    );
  }
}
