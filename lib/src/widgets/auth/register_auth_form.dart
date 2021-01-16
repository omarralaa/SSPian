import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/models/profile.dart';
import 'package:sspian/src/providers/auth.dart';

import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/utils/validations.dart';

class RegisterAuthForm extends StatefulWidget {
  @override
  _RegisterAuthFormState createState() => _RegisterAuthFormState();
}

class _RegisterAuthFormState extends State<RegisterAuthForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _sspIDFocusNode = FocusNode();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _sspIDController = TextEditingController();

  final Validations _validations = Validations();

  bool _isPasswordHidden = true;
  bool _isLoading = false;

  static const departments = <String>['CCE', 'CAE', 'GPE', 'OCE', 'EME'];
  String departmentDropDownValue = departments[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              _buildNameTextField(),
              _buildEmailTextField(),
              SizedBox(height: Utils.size.height * 0.01),
              _buildPasswordTextField(),
              _buildSSPIdField(),
              _buildDepartmentDropDown(),
              _buildSignUpButton(),
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
        onFieldSubmitted: (_) => _sspIDFocusNode.requestFocus(),
      ),
    );
  }

  Widget _buildSSPIdField() {
    return Container(
      child: TextFormField(
        controller: _sspIDController,
        decoration: InputDecoration(
          labelText: 'SSP ID',
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'Ex. 1234',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        focusNode: _sspIDFocusNode,
        validator: _validations.validateSSPId,
        maxLength: 6,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: Utils.size.width * 0.59,
      height: Utils.size.height * 0.105,
      padding: EdgeInsets.only(top: Utils.size.height * 0.05),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).primaryColor,
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: _isLoading ? null : _submit,
      ),
    );
  }

  Widget _buildDepartmentDropDown() {
    final departmentList = departments.map<DropdownMenuItem<String>>((value) {
      return DropdownMenuItem<String>(
        child: Text(value),
        value: value,
      );
    }).toList();

    return Container(
      padding: EdgeInsets.only(top: Utils.size.height * 0.005),
      width: double.infinity,
      height: Utils.size.height * 0.08,
      child: DropdownButton<String>(
        isExpanded: true,
        value: departmentDropDownValue,
        items: departmentList,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Theme.of(context).primaryColor,
        ),
        onChanged: (value) {
          setState(() {
            departmentDropDownValue = value;
          });
        },
      ),
    );
  }

  void _submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      final auth = Provider.of<Auth>(context, listen: false);

      final profile = {
        'firstName': _fullNameController.text.split(' ')[0],
        'lastName': _fullNameController.text.split(' ')[1],
        'email': _emailController.text,
        'password': _passwordController.text,
        'sspID': _sspIDController.text,
        'department': departmentDropDownValue,
      };

      try {
        await auth.register(profile);
      } catch (err) {
        showError(err);
      }
      setState(() => _isLoading = false);
    }
  }

  void showError(err) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
  }
}
