import 'package:finalexam/editViewModel.dart';
import 'package:finalexam/note.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditScreen extends StatefulWidget {
  final String type;

  const EditScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

//
class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditViewModel>.reactive(
        viewModelBuilder: () => EditViewModel(),
        builder: (context, model, child) {
          if (widget.type != "add") {
            _titleController.text = model.data!.title!;
            _descriptionController.text = model.data!.content!;
          }
          if (!model.dataReady) {
            return Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              centerTitle: true,
              title: Text(widget.type == "view"
                  ? "View Note"
                  : widget.type == "edit"
                      ? "Edit Note"
                      : "Add New Note"),
              actions: [
                widget.type == "view"
                    ? Center()
                    : IconButton(
                        icon: const Icon(
                          Icons.check_circle,
                          size: 30,
                        ),
                        onPressed: () {
                          if (widget.type == "add") {
                            model.saveAdd(_titleController.text,
                                _descriptionController.text);
                          } else if (widget.type == "edit") {
                            model.saveEdit(_titleController.text,
                                _descriptionController.text);
                          }
                        }),
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
                    enabled: widget.type == "view" ? false : true,
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
                        enabled: widget.type == "view" ? false : true,
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
