import 'package:flutter/material.dart';
import 'package:sspian/src/screens/auth/widgets/login_auth_form.dart';
import 'package:sspian/src/screens/auth/widgets/register_auth_form.dart';

import 'package:sspian/src/utils/constants.dart';

import 'package:sspian/src/widgets/social_login_footer.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: [
          //UpperSquaresBackground(),
          //DownSquaresBackground(),
          _buildBody(),
        ]),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.12),
      child: Column(
        children: [
          _buildLogo(),
          _isLogin ? LoginAuthForm() : RegisterAuthForm(),
          _buildSwitchAuthButton(),
          SizedBox(height: Constants.height * 0.045),
          SocialLoginFooter(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: Constants.height * .05),
      child: Image.asset('assets/images/logo_transparent.png'),
    );
  }

  Widget _buildSwitchAuthButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _isLogin ? 'Dont have an account?' : 'Already a user?',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).accentColor,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(width: Constants.width * 0.01),
        Container(
          padding: EdgeInsets.only(top: Constants.height * 0.012),
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => setState(() => _isLogin = !_isLogin),
            child: Text(
              _isLogin ? 'Register Now' : 'Login Now',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
