import 'dart:convert';

class UserModal {
  String? uid;
  String? userName;
  String? nickName;
  String? userEmail;
  String? userPhotoURL;
  String? avatarPhotoURL;

  UserModal({
    this.uid,
    this.userName,
    this.nickName,
    this.userEmail,
    this.userPhotoURL,
    this.avatarPhotoURL,
  });

  /// Convert a UserModal object into a Map (for Firestore or JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userName': userName,
      'nickName': nickName,
      'userEmail': userEmail,
      'userPhotoURL': userPhotoURL,
      'avatarPhotoURL': avatarPhotoURL,
    };
  }

  /// Create a UserModal object from a Map (for Firestore or JSON deserialization)
  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
      uid: json['uid'],
      userName: json['userName'],
      nickName: json['nickName'],
      userEmail: json['userEmail'],
      userPhotoURL: json['userPhotoURL'],
      avatarPhotoURL: json['avatarPhotoURL'],
    );
  }

  /// Method to decode the avatarPhotoURL from JSON string to a Map
  Map<String, dynamic>? getAvatarOptions() {
    if (avatarPhotoURL != null && avatarPhotoURL!.isNotEmpty) {
      return jsonDecode(avatarPhotoURL!); // Decodes the JSON string into a Map
    }
    return null; // Return null if avatarPhotoURL is null or empty
  }
}