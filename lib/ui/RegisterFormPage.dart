import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/model/User.dart';
import 'package:untitled6/ui/UserInfoPage.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormPageState();
  }
}

class _RegisterFormPageState extends State<RegisterFormPage> {

  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKeyc = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passworController = TextEditingController();
  final _confirmController = TextEditingController();

  List<String> countries = ['Russia','Ukraina','Germany','France'];
  var _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passworController.dispose();
    _confirmController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fielFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyc,
      appBar: AppBar(
        title: Text("Register Form"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
              TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_){
                  _fielFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Full Name *",
                  hintText: "What do people call you?",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                validator: (val) => val!.isEmpty ? "Name is requared" : null,
                inputFormatters: [
                ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              autofocus: true,
              onFieldSubmitted: (_){
                _fielFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                  labelText: "Phone Number *",
                  hintText: "Where can we reach you?",
                  helperText: "Phone format: (XX) XXX XX XX",
                  prefixIcon: Icon(Icons.call),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))
              ),
              keyboardType: TextInputType.phone,
              onSaved: (value) => newUser.phone = value.toString(),
              // inputFormatters: [
              //   FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true)
              // ],
              validator: (value) => _validatePhoneNumber(value!) ? null : 'Phone number must be entered as (###)###-####',
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email Address *",
                hintText: "Enter a email address",
                icon: Icon(Icons.email)
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              value: _selectedCountry,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Country?'
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
              items: countries.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList()
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: "Life Story *",
                hintText: "Tell us about your self",
                helperText: "Keep it short is just a demo",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              focusNode: _passFocus,
              autofocus: true,
              controller: _passworController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                icon: Icon(Icons.security),
                labelText: "Password *",
                hintText: "Enter the password",
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _confirmController,
              maxLength: 8,
              obscureText: _hidePass,
              decoration: InputDecoration(
                labelText: "Confirm Password *",
                hintText: "Confirm the password",
                icon: Icon(Icons.border_color)
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // __submitForm();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInFoPage()));
                },
                child: const Text(
                  "Submit Form",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void __submitForm(){
    if(_formKey.currentState!.validate()){
      print("Form is valid");
      print("Name :${_nameController.text}");
      print("Phone :${_phoneController.text}");
      print("Email :${_emailController.text}");
      print("Story :${_storyController.text}");
      print("Password :${_passworController.text}");
      print("Confirm :${_confirmController.text}");
    } else{
      _showMessage('Form is not');
    }
  }

  void _showMessage(String message){
    _scaffoldKeyc.currentState?.showBottomSheet(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
    ) as WidgetBuilder
    // SnackBar(
      // backgroundColor: Colors.red,
      // content: Text(message),
    );
  }

  String? _validateName(String value){
    final _nameExp = RegExp(r'[A-Za-z ]+$');
    if(value.isEmpty){
      return "Name is reqired:";
    }else if(_nameExp.hasMatch(value)){
      return "Please enter alphabit charactel";
    }else{
      return null;
    }
  }

  bool _validatePhoneNumber(String input){
    final _phoneExp = RegExp(r'^(\d\d\d)\d\d\d-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }
}
