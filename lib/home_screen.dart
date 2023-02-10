import 'package:flutter/material.dart';
import 'package:hive_storage_2/box/boxs.dart';
import 'package:hive_storage_2/models/notes_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _headingController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(
          "Hive Database",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: ValueListenableBuilder<Box<NotesModels>>(
        valueListenable: Boxs.getData.listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModels>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lime,
                  child: Column(
                    children: [
                      ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            deleteData(data[index]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        title: Text(
                          data[index].heading.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        subtitle: Text(
                          data[index].dscription.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void deleteData(NotesModels notesModels) async {
    await notesModels.delete();
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add NOtes"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _headingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Notes Heading",
                        labelText: "Heading",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Enter Description",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final data = NotesModels(
                      heading: _headingController.text,
                      dscription: _descriptionController.text);
                  final box = Boxs.getData;
                  box.add(data);
                  data.save();
                  _headingController.clear();
                  _descriptionController.clear();
                  print(data);
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          );
        });
  }
}
