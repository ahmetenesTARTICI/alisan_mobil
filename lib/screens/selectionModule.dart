import 'package:bitirme_projesi/models/userData.dart';
import 'package:bitirme_projesi/modulScreens/btScreen.dart';
import 'package:flutter/material.dart';

class selectionModule extends StatefulWidget {
  Data _user;
  selectionModule(this._user);

  @override
  _selectionModuleState createState() => _selectionModuleState();
}

class _selectionModuleState extends State<selectionModule> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidht = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: cricleAvatarTool(screenWidht, screenHeight),
            ),
            Column(
              children: [
                Text(widget._user.firstName.toString() + "   HOŞ GELDİN!"),

              ],
            ),
          ]),
          SizedBox(
            height: screenHeight * 0.7,
            width: screenWidht * 0.8,
            child: gridWievCountTool(screenWidht, screenHeight),
          )
        ],
      ),
    );
  }

  cricleAvatarTool(double screenWidht, double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.15,
      width: screenWidht * 0.20,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget._user.avatar!),
      ),
    );
  }


  gridWievCountTool(double screenWidht, double screenHeight) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("İnsan Kaynaklerı"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => btScreen()));
              },
              child: Text("Bilgi Teknolojileri"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Sigorta"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Hukuk"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Satın Alma"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("İdari işler"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Muhasebe"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
        Container(
            height: screenHeight * 0.02,
            width: screenWidht * 0.3,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Çıkış"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )),
      ],
    );
  }
}