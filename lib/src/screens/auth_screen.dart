import 'package:flutter/material.dart';
import 'package:sspian/src/utils/utils.dart';

import 'package:sspian/src/widgets/down_squares_background_widget.dart';
import 'package:sspian/src/widgets/social_login_footer.dart';
import 'package:sspian/src/widgets/upper_squares_background_widget.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = UniqueKey();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isPasswordHidden = true;
  bool _isLogin = true;

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                if (!_isLogin) _buildNameTextField(),
                _buildEmailTextField(),
                SizedBox(height: Utils.size.height * 0.01),
                _buildPasswordTextField(),
                _buildForgetPasswordButton(),
                _buildSignInButton(),
              ],
            ),
          ),
          _buildSwitchAuthButton(),
          SizedBox(
            height: Utils.size.height * 0.06,
          ),
          SocialLoginFooter(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: Utils.size.height * .05,
      ),
      child: Image.asset('assets/images/logo_transparent.png'),
    );
  }

  Widget _buildNameTextField() {
    return Container(
      height: Utils.size.height * 0.075,
      child: TextField(
        //key: UniqueKey(),
        decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'John Doe',
        ),
        onSubmitted: (val) => _emailFocusNode.requestFocus(),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      height: Utils.size.height * 0.075,
      child: TextField(
        //key: UniqueKey(),
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'john.doe@exmaple.com',
        ),
        focusNode: _emailFocusNode,
        onSubmitted: (val) => _passwordFocusNode.requestFocus(),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      height: Utils.size.height * 0.075,
      child: TextField(
        //key: UniqueKey(),
        focusNode: _passwordFocusNode,
        obscureText: _isPasswordHidden,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(fontSize: 16),
          suffixIcon: InkWell(
            child: Padding(
              padding: EdgeInsets.only(top: Utils.size.height * 0.016),
              child: Icon(
                _isPasswordHidden
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: _isPasswordHidden
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
              ),
            ),
            onTap: () => setState(() => _isPasswordHidden = !_isPasswordHidden),
          ),
          //contentPadding: EdgeInsets.only(),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Container(
      padding: EdgeInsets.only(top: Utils.size.height * 0.012),
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      width: Utils.size.width * 0.59,
      height: Utils.size.height * 0.105,
      padding: EdgeInsets.only(top: Utils.size.height * 0.05),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).primaryColor,
        child: Text(
          _isLogin ? 'SIGN IN' : 'SIGN UP',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
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
        SizedBox(width: Utils.size.width * 0.01),
        Container(
          padding: EdgeInsets.only(top: Utils.size.height * 0.012),
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
