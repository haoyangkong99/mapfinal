import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/note.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/dataPassingService.dart';
import 'package:finalexam/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewViewModel extends BaseViewModel {
  final navigate = locator<NavigationService>();
  final db = locator<DatabaseService>();
  final auth = locator<AuthService>();
  final datapass = locator<DataPassingService>();
  Note? obj;

  ViewViewModel() {
    fetch();
  }
  Future<void> fetch() async {
    Note x = datapass.data;
    await db.readDocumentAsFuture("notes/${auth.getUID()}/note", x.id);
    notifyListeners();
  }

  Note? getNoteInfo() {
    return obj;
  }

  void navigateBack() {
    navigate.popRepeated(1);
  }
}
