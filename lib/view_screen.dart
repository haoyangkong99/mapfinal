import 'package:finalexam/note.dart';
import 'package:finalexam/viewViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  TextEditingController? _titleController;
  TextEditingController? _descriptionController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewViewModel>.reactive(
        viewModelBuilder: () => ViewViewModel(),
        builder: (context, model, child) {
          // _titleController =
          //     TextEditingController(text: model.getNoteInfo()!.title);
          // _descriptionController =
          //     TextEditingController(text: model.getNoteInfo()!.content);
          print(model.getNoteInfo()!.content);
          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              centerTitle: true,
              title: const Text('View Note'),
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.cancel_sharp,
                      size: 30,
                    ),
                    onPressed: () {
                      model.navigateBack();
                    }),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    initialValue: null,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: 'Type the title here',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: _descriptionController,
                        enabled: false,
                        initialValue: null,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: 'Type the description',
                        ),
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
