import 'package:demo/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datas.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meassages'),
          actions: [
            IconButton(
                onPressed: () {
                  signOut(context);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(
                      datas[index]['name'],
                      style: TextStyle(fontFamily: 'Oswald'),
                    ),
                    subtitle: Text(datas[index]['meassage']),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(datas[index]['ima']),
                      backgroundColor: Colors.green,
                    ),
                    trailing: Text('$index:00PM'),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider();
                },
                itemCount: datas.length)));
  }

  void signOut(BuildContext ctx) async {
    SharedPreferences database = await SharedPreferences.getInstance();
    database.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}
