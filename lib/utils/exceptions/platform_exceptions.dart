/* ------------------------------------------------------------------------- */
/*                                  CHAT-GPT                                 */
/* ------------------------------------------------------------------------- */

class EPlatformException implements Exception {
  final String code;
  late String message;

  EPlatformException(this.code) {
    switch (code) {
      case 'network_error':
        message = 'A network error occurred. Please check your internet connection and try again.';
        break;
      case 'not_found':
        message = 'The requested resource was not found.';
        break;
      case 'access_denied':
        message = 'You do not have permission to perform this action.';
        break;
      case 'cancelled':
        message = 'The operation was cancelled.';
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
