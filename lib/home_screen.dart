import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hive Database"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
              future: Hive.openBox('details'),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                      trailing: IconButton(
                        onPressed: () {
                          snapshot.data!.put('name', 'Vivek');
                          snapshot.data!.put('age', 25);
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                );
              }),
          FutureBuilder(
              future: Hive.openBox('moreDetails'),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      subtitle: Text(snapshot.data!.get('no').toString()),
                      trailing: IconButton(
                        onPressed: () {
                          snapshot.data!.put('name', 'Vihang');
                          snapshot.data!.put('no', 7567569635);
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          var box = await Hive.openBox('details');
          var box2 = await Hive.openBox('moreDetails');

          box.put('name', "Parth");
          box.put('age', 21);

          box2.put('name', 'Milan');
          box2.put('no', 9658436256);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
