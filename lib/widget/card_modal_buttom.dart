import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({Key? key, required this.addTask}) : super(key: key);

  final Function addTask;
  TextEditingController namestask = TextEditingController();
  TextEditingController timestask = TextEditingController();
  void _handleOnclick(BuildContext context) {
    final name = namestask.text;
    final time = timestask.text;
    if (name.isEmpty && time.isEmpty) {
      return;
    }
    addTask(name, time);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: namestask,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your task',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: timestask,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'time',
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handleOnclick(context),
                child: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
