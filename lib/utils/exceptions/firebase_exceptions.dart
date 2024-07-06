/* ------------------------------------------------------------------------- */
/*                                  CHAT-GPT                                 */
/* ------------------------------------------------------------------------- */

class EFirebaseException implements Exception {
  final String code;
  late String message;

  EFirebaseException(this.code) {
    switch (code) {
      case 'permission-denied':
        message = 'You do not have permission to perform this action.';
        break;
      case 'unavailable':
        message = 'The service is currently unavailable.';
        break;
      case 'deadline-exceeded':
        message = 'The operation took too long to complete.';
        break;
      case 'not-found':
        message = 'The requested resource was not found.';
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
