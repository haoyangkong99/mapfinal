import 'dart:async';

import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/edit_screen.dart';
import 'package:finalexam/note.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/dataPassingService.dart';
import 'package:finalexam/services/databaseService.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<Note>> {
  final navigate = locator<NavigationService>();
  final storageService = locator<DatabaseService>();
  final auth = locator<AuthService>();
  final datapassing = locator<DataPassingService>();
  Stream<List<Note>> get stream => fetchNote();
  Stream<List<Note>> fetchNote() {
    print(auth.getUID());
    return storageService
        .readCollectionAsStream("notes/${auth.getUID()}/note")
        .map(
            (event) => event.docs.map((e) => Note.fromJson(e.data())).toList());
  }

  Future<void> deleteNote(String id) async {
    await storageService.delete("notes/${auth.getUID()}/note", id);
  }

  void navigateToSecondScreen(Note obj, String x) {
    datapassing.assign(obj);
    navigate.navigateToView(EditScreen(
      type: x,
    ));
  }

  void navigateToAdd(String x) {
    navigate.navigateToView(EditScreen(type: x));
  }
}
