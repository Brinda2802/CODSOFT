import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListDoScreen(),
    );
  }
}

class ListDoScreen extends StatefulWidget {
  @override
  _ListDoScreenState createState() => _ListDoScreenState();
}

class _ListDoScreenState extends State<ListDoScreen> {
  List<String> items = ['Task 1', 'Task 2', 'Task 3']; // Sample list items
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemPink,
        title: Text('ListDo App'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("To create List to do app",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          height:40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black26)
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit,color: Colors.black,size:25),
                            onPressed: () {
                              // Implement edit functionality here
                              // You can show a dialog or navigate to an edit screen
                            },
                          ),
                        ),
                      ),
                      Container(
                        height:40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black26)
                        ),
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add a task',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String newTask = textEditingController.text;
                      if (newTask.isNotEmpty) {
                        items.add(newTask);
                        textEditingController.clear();
                      }
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
