/// Custom exception class to handle various Firebase-related errors.
class EFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  EFirebaseException(this.code);

  /* ----------------------------------------------------------------------- */

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      /* ------------------------------------------------------------------- */

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';

      /* ------------------------------------------------------------------- */

      //! Bạn không có quyền thực hiện hành động này.
      case 'permission-denied':
        return 'You do not have permission to perform this action.';

      //! Dịch vụ hiện không khả dụng.
      case 'unavailable':
        return 'The service is currently unavailable.';

      //! Hết thời gian yêu cầu.
      case 'deadline-exceeded':
        return 'The operation took too long to complete.';

      //! Không tìm thấy tài nguyên yêu cầu.
      case 'not-found':
        return 'The requested resource was not found.';

      //! Đã vượt quá hạn ngạch.
      case 'resource-exhausted':
        return 'Quota exceeded.';

      //! Hủy bỏ.
      case 'cancelled':
        return 'The operation was cancelled.';

      //! Dữ liệu bị lỗi.
      case 'data-loss':
        return 'Unrecoverable data loss or corruption.';

      //! Dữ liệu không hợp lệ.
      case 'invalid-argument':
        return 'Client specified an invalid argument.';

      //! Đã vượt quá giới hạn.
      case 'out-of-range':
        return 'Operation was attempted past the valid range.';

      //! Bị hạn chế.
      case 'failed-precondition':
        return 'Operation was rejected because the system is not in a state required for the operation\'s execution.';

      //! Đã bị hủy bỏ.
      case 'aborted':
        return 'The operation was aborted, typically due to a concurrency issue such as a sequencer check failure or transaction abort.';

      //! Không được triển khai.
      case 'unimplemented':
        return 'Operation is not implemented or not supported/enabled.';

      //! Chưa xác thực.
      case 'unauthenticated':
        return 'The request does not have valid authentication credentials for the operation.';

      //! Bị chặn bởi bảo mật.
      case 'internal':
        return 'Internal error. This means some invariants expected by the underlying system have been broken.';

      //! Hành động nhạy cảm này cần người dùng đăng nhập lại.
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';

      //! Tài khoản đã tồn tại với một thông tin đăng nhập khác.
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials.';

      //! Thông tin đăng nhập này đã được sử dụng bởi một tài khoản khác.
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';

      /* ------------------------------------------------------------------- */

      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';

      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';

      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';

      case 'user-disabled':
        return 'The user account has been disabled.';

      case 'user-not-found':
        return 'No user found for the given email or UID.';

      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';

      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';

      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';

      case 'weak-password':
        return 'The password is too weak. Please choose a stronger passwork.';

      case 'provider-already-linked':
        return 'The account is already linked with another provider.';

      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';

      case 'invalid-credential':
        return 'The supplied credential is malformed of has expired.';

      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';

      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';

      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';

      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';

      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';

      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';

      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later';

      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';

      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';

      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.';

      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification link.';

      case 'missing-app-credential':
        return 'The app credential is missing. Please provide valid app credentials.';

      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';

      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';

      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';

      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';

      case 'user-token-mismatch':
        return "The provided user's token has a mismatch with the authenticated user's user ID.";

      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';

      case 'invalid-sender':
        return "The email template sender is invalid. Please verify the sender's email";

      case 'invalid-recipient-email':
        return 'The recipient email address in invalid. Please provide a valid recipient email.';

      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'user-token-expired':
        return "The user's token has expired, and authentication is required. Please sign in again.";

      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';

      /* ------------------------------------------------------------------- */

      // Add more case statements for other error codes if needed
      default:
        return 'An unexpected Firebase error occurred. Please try again.';

      /* ------------------------------------------------------------------- */
    }
  }
}
