/* ------------------------------------------------------------------------- */
/*                                  CHAT-GPT                                 */
/* ------------------------------------------------------------------------- */

class EFormatException implements Exception {
  final String message;

  const EFormatException([this.message = 'Invalid format.']);

  @override
  String toString() {
    return message;
  }
}
