import 'dart:async';

import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/note.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/dataPassingService.dart';
import 'package:finalexam/services/databaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditViewModel extends StreamViewModel<Note> {
  final navigate = locator<NavigationService>();
  final storageService = locator<DatabaseService>();
  final auth = locator<AuthService>();
  final datapassing = locator<DataPassingService>();
  Stream<Note> get stream => fetchNote();
  Stream<Note> fetchNote() {
    print(auth.getUID());
    Note temp = datapassing.data;
    return storageService
        .readDocumentAsStream("notes/${auth.getUID()}/note", temp.id)
        .map((event) => Note.fromJson(event.data()));
  }

  void navigateBack() {
    navigate.popRepeated(1);
  }
}
