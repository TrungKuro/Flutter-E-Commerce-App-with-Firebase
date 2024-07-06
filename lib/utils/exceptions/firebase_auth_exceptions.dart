/* ------------------------------------------------------------------------- */
/*                                  CHAT-GPT                                 */
/* ------------------------------------------------------------------------- */

class EFirebaseAuthException implements Exception {
  final String code;
  late String message;

  EFirebaseAuthException(this.code) {
    switch (code) {
      case 'invalid-email':
        message = 'The email address is not valid.';
        break;
      case 'user-disabled':
        message = 'The user account has been disabled by an administrator.';
        break;
      case 'user-not-found':
        message = 'There is no user record corresponding to this identifier. The user may have been deleted.';
        break;
      case 'wrong-password':
        message = 'The password is invalid or the user does not have a password.';
        break;
      // Add more case statements for other error codes if needed
      default:
        message = 'An unknown error occurred.';
    }
  }

  @override
  String toString() {
    return message;
  }
}
