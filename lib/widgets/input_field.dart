import 'package:flutter/material.dart';
import 'package:todolist/provider/note_provider.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController textEditingController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(
      () {
        setState(
          () {
            isButtonEnabled = textEditingController.text.isNotEmpty;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context);

    return Column(
      children: [
        TextField(
          controller: textEditingController,
          style: const TextStyle(
            fontSize: 18,
          ),
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Enter your notes',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          onChanged: (text) {
            setState(
              () {
                isButtonEnabled = text.isNotEmpty;
              },
            );
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            minimumSize: const Size(double.infinity, 55),
          ),
          onPressed: isButtonEnabled
              ? () {
                  final enteredText = textEditingController.text;
                  if (enteredText.isNotEmpty) {
                    notes.addItem(enteredText);
                    textEditingController.clear();
                    setState(() {
                      isButtonEnabled = false;
                    });
                  }
                }
              : null,
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
