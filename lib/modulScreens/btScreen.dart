import 'package:flutter/material.dart';

class btScreen extends StatefulWidget {
  const btScreen({Key? key}) : super(key: key);

  @override
  _btScreenState createState() => _btScreenState();
}

class _btScreenState extends State<btScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Bilgi Teknolojileri Ve Arge"),
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: false,
              cacheExtent: 100.0,

              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent
                  ),
                  child: ListTile(title: Text("Bilgi güvenliği süreçleri"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),),
                  margin: EdgeInsets.all(18),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent
                  ),
                  child: ListTile(title: Text("Hizmet yönetimi"),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),),
                  margin: EdgeInsets.all(18),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent
                  ),
                  child: ListTile(title: Text("Bt yönetici onay"),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),),
                  margin: EdgeInsets.all(18),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent
                  ),
                  child: ListTile(title: Text("It yönetici onay"),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),),
                  margin: EdgeInsets.all(18),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent
                  ),
                  child: ListTile(title: Text("Talepler"),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),),
                  margin: EdgeInsets.all(18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
