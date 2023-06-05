import 'package:flutter/material.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:whatsapp_project/login.dart';
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xfff075e54),
          title: const Text('Whatsapp'),
          actions: [
            IconButton(onPressed: (() {}), icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: const Icon(Icons.exit_to_app))
          ],
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xfff075e54),
          )),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('Person$index'),
              subtitle: Text('message$index'),
              leading: (index % 2 == 1)
                  ? const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.siasat.com/wp-content/uploads/2021/04/allu-arjun-1.jpg'),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                          'https://yt3.googleusercontent.com/ytc/AMLnZu-Niy4xRPBN9WsTqRq697n_d8Ui-Ap-cCMzIc3Xmw=s900-c-k-c0x00ffffff-no-rj'),
                    ));
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 9,
      )),
    );
  }

  signout(BuildContext ctx) async {
    final _sherePrefs = await SharedPreferences.getInstance();
    await _sherePrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LogIn()), (route) => false);
  }
 
}
