import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sspian/src/screens/home_screen.dart';
import 'package:sspian/src/screens/auth_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SSPIAN',
        theme: ThemeData(
          primarySwatch: primaryColorSwatch,
          accentColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomeScreen(),
        routes: {
          //AuthScreen.routeName: (ctx) => AuthScreen()
        });
  }
}

MaterialColor primaryColorSwatch = MaterialColor(0xFFDC3030, primaryColorMap);

Map<int, Color> primaryColorMap = {
  50: Color.fromRGBO(220, 48, 48, .1),
  100: Color.fromRGBO(220, 48, 48, .2),
  200: Color.fromRGBO(220, 48, 48, .3),
  300: Color.fromRGBO(220, 48, 48, .4),
  400: Color.fromRGBO(220, 48, 48, .5),
  500: Color.fromRGBO(220, 48, 48, .6),
  600: Color.fromRGBO(220, 48, 48, .7),
  700: Color.fromRGBO(220, 48, 48, .8),
  800: Color.fromRGBO(220, 48, 48, .9),
  900: Color.fromRGBO(220, 48, 48, 1),
};
