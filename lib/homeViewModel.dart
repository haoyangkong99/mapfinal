import 'dart:async';

import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/note.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/databaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<Note>> {
  final navigate = locator<NavigationService>();
  final storageService = locator<DatabaseService>();
  final auth = locator<AuthService>();
  Stream<List<Note>> get stream => fetchNote();
  Stream<List<Note>> fetchNote() {
    print(auth.getUID());
    return storageService.readCollectionAsStream("notes").map((event) => event
        .docs
        .map((e) => Note.fromJson(e.data()))
        .toList()
        .where((element) => element.id == auth.getUID())
        .toList());
  }
}
