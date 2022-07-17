import 'dart:async';

import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/note.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/databaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final navigate = locator<NavigationService>();
  final storageService = locator<DatabaseService>();
  final auth = locator<AuthService>();

  Future<void> deleteNote(String docid) async {
    await storageService.delete("", docid);
  }
}
