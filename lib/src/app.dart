import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/profile.dart';

import 'package:sspian/src/screens/home_screen.dart';
import 'package:sspian/src/screens/auth_screen.dart';
import 'package:sspian/src/screens/splash_screen.dart';

import 'providers/auth.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (ctx) => ProfileProvider(),
        ),
        ChangeNotifierProvider<CourseProvider>(
          create: (ctx) => CourseProvider(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'SSPIAN',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.grey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.latoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: home(context, auth),
            routes: {
              //AuthScreen.routeName: (ctx) => AuthScreen()
            },
          );
        },
      ),
    );
  }
}

home(context, auth) {
  if (auth.isAuth) {
    Provider.of<ProfileProvider>(context, listen: false).setProfile(auth.profile);
    return HomeScreen();
  } else {
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? SplashScreen()
            : AuthScreen();
      },
    );
  }
}
