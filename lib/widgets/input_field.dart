import 'package:flutter/material.dart';
import 'package:todolist/provider/note_provider.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context);

    return Column(
      children: [
        TextField(
          controller: _textEditingController,
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
          onPressed: () {
            final enteredText = _textEditingController.text;
            if (enteredText.isNotEmpty) {
              notes.addItem(enteredText);
              _textEditingController.clear();
            }
          },
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
