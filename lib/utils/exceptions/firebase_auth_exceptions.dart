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

      // Add more case statements for other error codes if needed
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
