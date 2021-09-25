import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw4/module/user.dart';
import 'package:hw4/user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPage createState() => _RegisterFormPage();
}

class _RegisterFormPage extends State<RegisterFormPage> {
  User newUser = new User();

  List<String> _countries = [
    'Russia',
    'Ukraine',
    'Germany',
    'French',
    'Usa',
    'China'
  ];
  final _formKey = GlobalKey<FormState>();
  String? _selectedCountry;
  bool _passShow = true;
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    _emailController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: Icon(Icons.delete, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              validator: _validateName,
              onSaved: (value) => newUser.name = _nameController.text,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                focusNode: _phoneFocus,
                onFieldSubmitted: (_) {
                  _fieldFocusChange(context, _phoneFocus, _passFocus);
                },
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'^[()\d-]{1,15}$'),
                      allow: true)
                ],
                decoration: InputDecoration(
                  labelText: 'Phone Number *',
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _phoneController.clear();
                    },
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  helperText: 'Phone Format: (XXX)XXX-XXXX',
                ),
                validator: (val) => _validatePhone(val!)
                    ? null
                    : 'Phone number must be entered as (###)###-#####',
                onSaved: (value) => newUser.phone = value),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter your Email',
                  icon: Icon(Icons.mail),
                ),
                onSaved: (value) => newUser.email = value),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Country',
                icon: Icon(Icons.map),
                border: OutlineInputBorder(),
              ),
              items: _countries
                  .map((country) => DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      ))
                  .toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data as String?;
                  newUser.country = data;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Life story',
                  border: OutlineInputBorder(),
                  helperText: 'Keep it short, this is just demo',
                ),
                maxLines: 3,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                onSaved: (value) => newUser.story = value),
            TextFormField(
              focusNode: _passFocus,
              obscureText: _passShow,
              controller: _passController,
              maxLength: 16,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.security),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passShow = !_passShow;
                    });
                  },
                  icon:
                      Icon(_passShow ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              validator: _validatePass,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _passShow,
              maxLength: 16,
              decoration: InputDecoration(
                labelText: 'Confirm the password',
                icon: Icon(Icons.edit),
              ),
              validator: _validatePass,
            ),
            RaisedButton(
              onPressed: _submitForm,
              color: Colors.green,
              child: Text(
                'Submit form',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_nameController.text);
      _showDialog(_nameController.text);
      print(newUser.name);
      print(newUser.email);

    } else {
      print('Form is not valid! Please review and correct');
    }
  }

  String? _validateName(String? value) {
    //final _nameExp = RegExp(r'^[A-Z a-z]+$');
    if (value!.isEmpty) {
      return 'Name is required';
    } //else if (!_nameExp.hasMatch(value)) {
    //return 'Please enter alphabetical characters';
    // }
    else {
      return null;
    }
  }

  bool _validatePhone(String value) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return _phoneExp.hasMatch(value);
  }

  String? _validatePass(String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    } else if (_confirmPassController.text != _passController.text) {
      return 'Passwords not equals';
    } else
      return null;
  }

  void _showDialog(String name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Registration Successful'),
            content: Text(
              '$name is now a verified register form',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserInfoPage(userInfo: newUser,)));
                },
                child: Text(
                  'Verified',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
              )
            ],
          );
        });
  }
}
