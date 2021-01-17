import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sspian/src/screens/home_screen.dart';
import 'package:sspian/src/screens/auth_screen.dart';
import 'package:sspian/src/screens/splash_screen.dart';
import 'package:sspian/src/utils/utils.dart';

import 'providers/auth.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, _) {
        return MaterialApp(
            title: 'SSPIAN',
            theme: ThemeData(
              primarySwatch: Utils.primaryColorSwatch,
              accentColor: Colors.grey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.latoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: auth.isAuth
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? HomeScreen()
                          : AuthScreen();
                    }),
            routes: {
              //AuthScreen.routeName: (ctx) => AuthScreen()
            });
      }),
    );
  }
}

