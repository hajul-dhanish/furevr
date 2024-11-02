class UserRegisterModel {
  String? id;
  String? phoneNumber;
  String? displayName;
  String? email;
  bool? isEmailVerified;
  String? uid;
  String? creationTime;
  String? lastSignInTime;
  bool? isNewUser;
  String? userId;

  UserRegisterModel({
    this.id,
    this.phoneNumber,
    this.displayName,
    this.email,
    this.isEmailVerified,
    this.uid,
    this.creationTime,
    this.lastSignInTime,
    this.isNewUser,
    this.userId,
  });

  // Factory constructor to create a UserRegisterModel from JSON
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      uid: json['uid'] as String?,
      creationTime: json['creationTime'] as String?,
      lastSignInTime: json['lastSignInTime'] as String?,
      isNewUser: json['isNewUser'] as bool?,
      userId: json['userId'] as String?,
    );
  }

  // Method to convert a UserRegisterModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'uid': uid,
      'creationTime': creationTime,
      'lastSignInTime': lastSignInTime,
      'isNewUser': isNewUser,
      'userId': userId,
    };
  }
}
