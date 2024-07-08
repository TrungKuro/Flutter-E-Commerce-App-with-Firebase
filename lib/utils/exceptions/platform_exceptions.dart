/// Custom exception class to handle various platform-related errors.
class EPlatformException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  EPlatformException(this.code);

  /* ----------------------------------------------------------------------- */

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      /* ------------------------------------------------------------------- */

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';

      /* ------------------------------------------------------------------- */

      //! Lỗi mạng.
      case 'network_error':
        return 'A network error occurred. Please check your internet connection and try again.';

      //! Không tìm thấy tài nguyên.
      case 'not_found':
        return 'The requested resource was not found.';

      //! Bị từ chối truy cập.
      case 'access_denied':
        return 'You do not have permission to perform this action.';

      //! Hành động bị hủy bỏ.
      case 'cancelled':
        return 'The operation was cancelled.';

      //! Dịch vụ hiện không khả dụng.
      case 'unavailable':
        return 'The service is currently unavailable.';

      //! Dịch vụ hiện không khả dụng.
      case 'internal':
        return 'An internal error occurred. Please try again later.';

      //! Đối số không hợp lệ.
      case 'invalid-argument':
        return 'An invalid argument was provided.';

      //! Đã vượt quá giới hạn.
      case 'out-of-range':
        return 'The operation was attempted past the valid range.';

      //! Tài nguyên đã tồn tại.
      case 'already-exists':
        return 'The resource already exists.';

      //! Hết hạn.
      case 'deadline-exceeded':
        return 'The operation took too long to complete.';

      //! Tài khoản chưa xác thực.
      case 'unauthenticated':
        return 'The request does not have valid authentication credentials for the operation.';

      //! Không được triển khai.
      case 'unimplemented':
        return 'The operation is not implemented or not supported/enabled.';

      //! Bị hủy bỏ.
      case 'aborted':
        return 'The operation was aborted, typically due to a concurrency issue such as a sequencer check failure or transaction abort.';

      //! Bị hạn chế.
      case 'failed-precondition':
        return 'The operation was rejected because the system is not in a state required for the operation\'s execution.';

      /* ------------------------------------------------------------------- */

      case 'too-many-requests':
        return 'Too many requests. Please try again later.';

      case 'invalid-password':
        return 'Incorrect password. Please try again.';

      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';

      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project.';

      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';

      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';

      case 'sign-in-failed':
        return 'Sign-in failed. Please try again.';

      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';

      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';

      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';

      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';

      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later';

      /* ------------------------------------------------------------------- */

      // Add more case statements for other error codes if needed
      default:
        return 'An unknown error occurred.';

      /* ------------------------------------------------------------------- */
    }
  }
}
