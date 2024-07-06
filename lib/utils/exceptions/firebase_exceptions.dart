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

      /* ------------------------------------------------------------------- */

      // Add more case statements for other error codes if needed
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
