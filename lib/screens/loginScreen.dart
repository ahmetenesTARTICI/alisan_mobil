import 'package:bitirme_projesi/screens/iForgetPasswordScreen.dart';
import 'package:bitirme_projesi/screens/selectionModule.dart';
import 'package:flutter/material.dart';

import '../api/userDataApi.dart';
import '../models/userData.dart';

final formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  userDataApi _user = userDataApi();
  List<Data> _listUser = <Data>[];
  Data userSelected =
      Data(id: 0, email: "", firstName: "", lastName: "", avatar: "");
  var sifre;
  bool? _isLoading;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: _isLoading== null ?Center(child: CircularProgressIndicator(),):_isLoading==true?Center(
      child: Column(
        children: [
          logoTool(screenHeight, screenWidht),
          Text(
            "GİRİŞ",
            style: TextStyle(
                fontSize: screenWidht * 0.06, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 32,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                emailTool(screenWidht),
                SizedBox(
                  height: 16,
                ),
                passwordTool(screenWidht),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidht * 0.52,
                    ),
                    iForgetPasswordTool(context)
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.18,
                ),
                loginButtonTool(screenWidht, screenHeight, context),
              ],
            ),
          )
        ],
      ),
    ):Center(child: Text("bir sorun oluştu"),));
  }

  void getUserData() {
    _user.fetchUserData().then((value) {
      if (value != null && value.data != null) {
        _listUser = value.data!;
        setState(() {
          _isLoading = true;
        });
      } else {
        print("veri almada sıkıntı var");
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  logoTool(double screenHeight, double screenWidht) {
    return SizedBox(
        height: screenHeight * 0.22,
        width: screenWidht,
        child: Image.asset("assets/images/alisan_logo.jpg"));
  }

  emailTool(double screenWidht) {
    return SizedBox(
      width: screenWidht * 0.48,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "E-mail adresi",
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          for (int i = 0; i < _listUser.length; i++) {
            if (value == _listUser[i].email) {
              return null;
            }
          }
          return "hatalı email";
        },
        onSaved: (value) {
          userSelected.email = value;
        },
      ),
    );
  }

  passwordTool(double screenWidht) {
    return SizedBox(
      width: screenWidht * 0.48,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Şifre",
          hintText: "Şifre",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        obscureText: true,
        validator: (value) {
          for (int i = 0; i < _listUser.length; i++) {
            if (value == _listUser[i].lastName) {
              userSelected.firstName = _listUser[i].firstName;
              userSelected.lastName = _listUser[i].lastName;
              userSelected.avatar = _listUser[i].avatar;
              return null;
            }
          }
          return "hatalı şifre";
        },
        onSaved: (value) {
          userSelected.lastName = value;
        },
      ),
    );
  }

  iForgetPasswordTool(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => iForgetPasswordScreen(_listUser)));
        },
        child: Text(
          "Şifremi Unuttum",
          style: TextStyle(color: Colors.redAccent),
        ));
  }

  loginButtonTool(
      double screenWidht, double screenHeight, BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      height: screenHeight * 0.10,
      width: screenWidht * 0.56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => selectionModule(userSelected)));
            } else {}
          },
          child: Text("Giriş Yap")),
    );
  }
}
