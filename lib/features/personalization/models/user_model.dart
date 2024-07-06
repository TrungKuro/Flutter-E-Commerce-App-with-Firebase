import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  /* ----------------------------------------------------------------------- */

  // Keep those values final which you do not want to update
  final String id;
  final String userName;
  final String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return UserModel(
        id: document.id,
        userName: data[ETexts.userModelUserName] ?? '',
        email: data[ETexts.userModelEmail] ?? '',
        firstName: data[ETexts.userModelFirstName] ?? '',
        lastName: data[ETexts.userModelLastName] ?? '',
        phoneNumber: data[ETexts.userModelPhoneNumber] ?? '',
        profilePicture: data[ETexts.userModelProfilePicture] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  /* ----------------------------------------------------------------------- */
  /*                                  GETTER                                 */
  /* ----------------------------------------------------------------------- */

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => EFormatter.formatPhoneNumber(phoneNumber);

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstName$lastName'; // Combine first and last name
    String usernameWithPrefix = 'cwt_$camelCaseUsername'; // Add "cwt_" prefix

    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: '',
        userName: '',
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.userModelFirstName: firstName,
      ETexts.userModelLastName: lastName,
      ETexts.userModelUserName: userName,
      ETexts.userModelEmail: email,
      ETexts.userModelPhoneNumber: phoneNumber,
      ETexts.userModelProfilePicture: profilePicture,
    };
  }

  /* ----------------------------------------------------------------------- */
}
