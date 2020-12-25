import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/auth.dart';

import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/utils/validations.dart';
import '../social_login_footer.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Validations _validations = Validations();

  bool _isPasswordHidden = true;
  bool _isLogin = true;

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
        _buildSwitchAuthButton(),
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
        onPressed: _submit,
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

  void _submit() async {
    if (_formKey.currentState.validate()) {
      final auth = Provider.of<Auth>(context, listen: false);
      try {
        if (_isLogin) {
          await auth.login(_emailController.text, _passwordController.text);
        } else {
          await auth.register(
            _fullNameController.text,
            _emailController.text,
            _passwordController.text,
          );
        }
      } catch (err) {
        showError(err);
      }
    }
  }

  void showError(err) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
  }
}
