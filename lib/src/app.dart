import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/announcement.dart';

import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/deadline.dart';
import 'package:sspian/src/providers/profile.dart';
import 'package:sspian/src/screens/announcement/announcements_screen.dart';
import 'package:sspian/src/screens/calendar_screen.dart';
import 'package:sspian/src/screens/home/home_screen.dart';
import 'package:sspian/src/screens/auth/auth_screen.dart';
import 'package:sspian/src/screens/splash_screen.dart';
import 'package:sspian/src/utils/constants.dart';

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
        ChangeNotifierProvider<AnnouncementProvider>(
          create: (ctx) => AnnouncementProvider(),
        ),
        ChangeNotifierProvider<DeadlineProvider>(
          create: (ctx) => DeadlineProvider(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'SSPIAN',
            theme: ThemeData(
              primarySwatch: Constants.primaryColorSwatch,
              accentColor: Color(0xff553c51),
              scaffoldBackgroundColor: Color(0xffeaebed),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.latoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: home(context, auth),
            routes: {
              AnnouncementsScreen.routeName: (ctx) => AnnouncementsScreen(),
              CalendarScreen.routeName: (ctx) => CalendarScreen()
            },
          );
        },
      ),
    );
  }
}

// ! Fix Bug of the SplashScreen
home(context, auth) {
  if (auth.isAuth) {
    Provider.of<ProfileProvider>(context, listen: false)
        .setProfile(auth.profile);
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
