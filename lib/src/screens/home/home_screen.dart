import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/update.dart';
import 'package:sspian/src/providers/auth.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/screens/home/widgets/home_menu_grid.dart';
import 'package:sspian/src/screens/home/widgets/home_page_header.dart';
import 'package:sspian/src/screens/home/widgets/home_upper_container.dart';
import 'package:sspian/src/screens/home/widgets/main_drawer.dart';

import 'widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isLoaded) {
      Provider.of<CourseProvider>(context, listen: false).getEnrolledCourses();
      Provider.of<UpdateProvider>(context, listen: false).getUpdates();
      Provider.of<UpdateProvider>(context, listen: false).getDeadlines();
      Provider.of<UpdateProvider>(context, listen: false)
          .getRecentUpcommingDeadlines();
      //Provider.of<DeadlineProvider>(context, listen: false).getDeadlines();
      _isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            HomePageHeader(_scaffoldKey),
            HomeUpperContainer(),
            HomeMenuGrid(),
            _buildTempLogout(),
          ],
        ),
        SummaryCard(),
      ],
    );
  }

  Widget _buildTempLogout() {
    return ElevatedButton(
        onPressed: () {
          Provider.of<Auth>(context, listen: false).logout();
        },
        child: Text('Logout'));
  }
}
