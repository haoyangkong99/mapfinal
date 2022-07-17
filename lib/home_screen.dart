import 'package:finalexam/homeViewModel.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const HomeScreen());

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showless = false;
  int? iconindex = null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (contex, model, child) {
          if (model.dataReady) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('My Notes'),
                actions: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade200,
                    child: Text(
                      model.data!.length.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: ListView.separated(
                  itemCount: model.data!.length,
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.blueGrey,
                      ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: SizedBox(
                        width: 110.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            iconindex != null && iconindex == index
                                ? IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      model.navigateToSecondScreen(
                                          model.data![index], "edit");
                                    },
                                  )
                                : Center(),
                            iconindex != null && iconindex == index
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      model.deleteNote(
                                        model.data![index].id.toString(),
                                      );
                                    },
                                  )
                                : Center(),
                          ],
                        ),
                      ),
                      title: Text(model.data![index].title.toString()),
                      subtitle: Text(_showless
                          ? ""
                          : model.data![index].content.toString()),
                      onTap: () {
                        model.navigateToSecondScreen(
                            model.data![index], "view");
                      },
                      onLongPress: () {
                        iconindex = index;
                        setState(() {});
                      },
                    );
                  }),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      heroTag: null,
                      child: _showless
                          ? Icon(Icons.menu)
                          : Icon(Icons.unfold_less),
                      tooltip: 'Show less. Hide notes content',
                      onPressed: () {
                        if (_showless) {
                          _showless = false;
                        } else {
                          _showless = true;
                        }

                        setState(() {});
                      }),

                  /* Notes: for the "Show More" icon use: Icons.menu */

                  FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.add),
                    tooltip: 'Add a new note',
                    onPressed: () {
                      model.navigateToAdd("add");
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
