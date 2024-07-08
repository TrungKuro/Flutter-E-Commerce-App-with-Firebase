/// Custom exception class to handle various Firebase authentication-related errors.
class EFirebaseAuthException implements Exception {
  /// The error code associated with the esception.
  final String code;

  /// Constructor that takes an error code.
  EFirebaseAuthException(this.code);

  /* ----------------------------------------------------------------------- */

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      /* ------------------------------------------------------------------- */

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';

      /* ------------------------------------------------------------------- */

      //! Email không hợp lệ.
      case 'invalid-email':
        return 'The email address is not valid.';

      //! Tài khoản người dùng đã bị vô hiệu hóa bởi quản trị viên.
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';

      //! Không tìm thấy người dùng tương ứng với email hoặc ID này.
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';

      //! Mật khẩu không chính xác hoặc người dùng không có mật khẩu.
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';

      //! Email đã được sử dụng bởi một tài khoản khác.
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';

      //! Đăng nhập bằng nhà cung cấp này (ví dụ: Email/Password) chưa được bật.
      case 'operation-not-allowed':
        return 'Sign-in with this provider is not enabled.';

      //! Mật khẩu được cung cấp quá yếu.
      case 'weak-password':
        return 'The password is too weak.';

      //! Thông tin đăng nhập này đã được sử dụng bởi một tài khoản khác.
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';

      //! Thông tin đăng nhập không hợp lệ hoặc đã hết hạn.
      case 'invalid-credential':
        return 'The credential is invalid or expired.';

      //! Tài khoản đã tồn tại với một thông tin đăng nhập khác.
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials.';

      //! Hành động nhạy cảm này cần người dùng đăng nhập lại.
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';

      //! Nhà cung cấp này đã được liên kết với tài khoản người dùng này.
      case 'provider-already-linked':
        return 'This provider is already linked to the user account.';

      //! Nhà cung cấp này không được liên kết với tài khoản người dùng.
      case 'no-such-provider':
        return 'This provider is not linked to the user account.';

      //! Mã xác minh không hợp lệ.
      case 'invalid-verification-code':
        return 'The verification code is invalid.';

      //! ID xác minh không hợp lệ.
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';

      //! Phiên xác minh đã hết hạn.
      case 'session-expired':
        return 'The verification session has expired.';

      //! Số điện thoại không hợp lệ.
      case 'invalid-phone-number':
        return 'The phone number is invalid.';

      //! Thiếu số điện thoại.
      case 'missing-phone-number':
        return 'The phone number is missing.';

      //! Token người dùng không hợp lệ.
      case 'invalid-user-token':
        return 'The user token is invalid.';

      //! Có quá nhiều yêu cầu từ thiết bị này. Vui lòng thử lại sau.
      case 'too-many-requests':
        return 'There are too many requests from this device. Try again later.';

      /* ------------------------------------------------------------------- */

      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later';

      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';

      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';

      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';

      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'user-token-expired':
        return "The user's token has expired, and authentication is required. Please sign in again.";

      case 'user-token-revoked':
        return "The user's token has been revoked. Please sign in again.";

      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';

      case 'invalid-sender':
        return "The email template sender is invalid. Please verify the sender's email";

      case 'invalid-recipient-email':
        return 'The recipient email address in invalid. Please provide a valid recipient email.';

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

      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.';

      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';

      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';

      case 'invalid-cordova-configuration':
        return 'The provided Cordova configuration is invalid';

      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';

      case 'user-token-mismatch':
        return "The provided user's token has a mismatch with the authenticated user's user ID.";

      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';

      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';

      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';

      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';

      /* ------------------------------------------------------------------- */

      // Add more case statements for other error codes if needed
      default:
        return 'An unexpected Firebase error occurred. Please try again.';

      /* ------------------------------------------------------------------- */
    }
  }
}
