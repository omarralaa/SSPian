import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/auth.dart';
import 'package:sspian/src/providers/profile.dart';

import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/utils/validations.dart';
import '../social_login_footer.dart';

class LoginAuthForm extends StatefulWidget {
  @override
  _LoginAuthFormState createState() => _LoginAuthFormState();
}

class _LoginAuthFormState extends State<LoginAuthForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Validations _validations = Validations();

  bool _isPasswordHidden = true;
  bool _isLogin = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        //_buildSwitchAuthButton(),
      ],
    );
  }

  Widget _buildNameTextField() {
    return Container(
      child: TextFormField(
        controller: _fullNameController,
        decoration: InputDecoration(
          labelText: 'Full Name',
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'John Doe',
        ),
        validator: _validations.validatefullName,
        onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'john.doe@exmaple.com',
        ),
        keyboardType: TextInputType.emailAddress,
        focusNode: _emailFocusNode,
        validator: _validations.validateEmail,
        onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      child: TextFormField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        obscureText: _isPasswordHidden,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(fontSize: 16),
          contentPadding:
              EdgeInsets.symmetric(vertical: Utils.size.height * 0.012),
          suffixIcon: InkWell(
            child: Icon(
              _isPasswordHidden
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
              color: _isPasswordHidden
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
            ),
            onTap: () => setState(() => _isPasswordHidden = !_isPasswordHidden),
          ),
        ),
        validator: _validations.validatePassword,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).primaryColor,
        child: Text(
          _isLogin ? 'SIGN IN' : 'SIGN UP',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: _isLoading ? null : _submit,
      ),
    );
  }

  void _submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      final auth = Provider.of<Auth>(context, listen: false);
      try {
        await auth.login(_emailController.text, _passwordController.text);
        Provider.of<Profile>(context, listen: false).setProfile(auth.profile);
      } catch (err) {
        showError(err);
        setState(() => _isLoading = false);
      }
    }
  }

  void showError(err) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
  }
}
