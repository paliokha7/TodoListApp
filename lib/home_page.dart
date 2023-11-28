import 'package:flutter/material.dart';
import 'package:todolist/pallete.dart';
import 'package:todolist/provider/note_provider.dart';
import 'package:todolist/widgets/input_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your notes',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputField(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'My Notes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.items.length,
                itemBuilder: (context, index) {
                  Color backgroundColor = palette[index % palette.length];
                  return Builder(
                    builder: (context) {
                      final item = notes.items[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          notes.removeItem(index);
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        },
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.centerRight,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.delete),
                          ),
                        ),
                        child: Card(
                          color: backgroundColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(
                              item,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
