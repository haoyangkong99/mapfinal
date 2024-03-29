import 'package:finalexam/edit_screen.dart';
import 'package:finalexam/home_screen.dart';
import 'package:finalexam/login_screen.dart';
import 'package:finalexam/services/authService.dart';
import 'package:finalexam/services/dataPassingService.dart';
import 'package:finalexam/services/databaseService.dart';
import 'package:finalexam/services/firebaseAuth.dart';
import 'package:finalexam/services/firebaseStore.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginScreen, initial: true),
  MaterialRoute(page: HomeScreen)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: FirebaseAuthentication, asType: AuthService),
  LazySingleton(classType: FirebaseStore, asType: DatabaseService),
  LazySingleton(classType: DataPassingService)
])
class AppSetup {}
