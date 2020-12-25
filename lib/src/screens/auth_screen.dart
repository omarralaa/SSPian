import 'package:flutter/material.dart';

import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/widgets/auth/auth_form.dart';
import 'package:sspian/src/widgets/down_squares_background_widget.dart';
import 'package:sspian/src/widgets/social_login_footer.dart';
import 'package:sspian/src/widgets/upper_squares_background_widget.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    Utils.size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        UpperSquaresBackground(),
        DownSquaresBackground(),
        _buildBody(),
      ]),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Utils.size.width * 0.12),
      child: Column(
        children: [
          _buildLogo(),
          AuthForm(),
          SizedBox(height: Utils.size.height * 0.045),
          SocialLoginFooter(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: Utils.size.height * .05),
      child: Image.asset('assets/images/logo_transparent.png'),
    );
  }
}
