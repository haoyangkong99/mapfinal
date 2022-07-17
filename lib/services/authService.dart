abstract class AuthService {
  String getUID();
  Future signIn(String email, String password);
}
