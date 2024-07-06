/// Custom exception class to handle various Firebase-related errors.
class EFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a genaric error message.
  const EFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Create a format exception from a specific error message.
  factory EFormatException.fromMessage(String message) {
    return EFormatException(message);
  }

  /// Create a format exception from a specific error code.
  factory EFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const EFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const EFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const EFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const EFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const EFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const EFormatException('The input should be a valid numeric format.');

      // Add more cases as needed...
      default:
        return const EFormatException('An unknown error.');
    }
  }

  /* ----------------------------------------------------------------------- */
  /*                                  GETTER                                 */
  /* ----------------------------------------------------------------------- */

  /// Get the corresponding error message.
  String get formattedMessage => message;
}
