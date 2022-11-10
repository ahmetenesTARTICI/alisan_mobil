import 'package:bitirme_projesi/models/userData.dart';
import 'package:flutter/material.dart';

final formKey2 = GlobalKey<FormState>();

class iForgetPasswordScreen extends StatefulWidget {

  late List<Data> _listUser = <Data>[];
  iForgetPasswordScreen(this._listUser);

  @override
  _iForgetPasswordScreenState createState() => _iForgetPasswordScreenState();
}

class _iForgetPasswordScreenState extends State<iForgetPasswordScreen> {
  late String sifre;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          logoTool(screenHeight, screenWidht),
          Text(
            "Şifremi Unuttum",
            style: TextStyle(
                color: Colors.black,
                fontSize: screenWidht * 0.06,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 32,
          ),
          Form(key: formKey2, child: emailTool(screenWidht)),
          SizedBox(
            height: screenHeight * 0.2,
          ),
          passwordBuyButtonTool(screenWidht, screenHeight, context),
        ],
      ),
    );
  }

  logoTool(double screenHeight, double screenWidht) {
    return SizedBox(
      height: screenHeight * 0.22,
      width: screenWidht,
      child: Image.asset("assets/images/alisan_logo.jpg"),
    );
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
          for (int i = 0; i < widget._listUser.length; i++) {
            if (value == widget._listUser[i].email) {
              sifre = widget._listUser[i].lastName!;
              return null;
            }
          }
          return "hatalı email";
        },
      ),
    );
  }

  passwordBuyButtonTool(
      double screenWidht, double screenHeight, BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      height: screenHeight * 0.08,
      width: screenWidht * 0.44,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {
            if (formKey2.currentState!.validate()) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Şifreniz "),
                    content: Text(sifre.toString()),
                    actions: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
                        },
                        child: Text("Ana Sayfaya Don"),
                      )
                    ],
                  );
                },
              );
            } else {}
          },
          child: Text("Şifre Al")),
    );
  }
}
