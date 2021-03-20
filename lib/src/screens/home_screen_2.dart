import 'package:flutter/material.dart';
import 'package:sspian/src/widgets/home/home_menu_grid.dart';

import 'package:sspian/src/widgets/home/home_page_header.dart';
import 'package:sspian/src/widgets/home/home_upper_container.dart';
import 'package:sspian/src/widgets/home/main_drawer.dart';
import 'package:sspian/src/widgets/home/summary_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
          ],
        ),
        SummaryCard(),
      ],
    );
  }
}
