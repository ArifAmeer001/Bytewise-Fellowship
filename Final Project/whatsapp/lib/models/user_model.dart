class UserModel{
  final String name;
  final String profilePic;
  final String uid;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;

  UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId
  });

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'uid' : uid,
      'profilePic' : profilePic,
      'isOnline' : isOnline,
      'phoneNumebr' : phoneNumber,
      'groupId' : groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
        name : map['name'] ?? '',
        profilePic : map['profilePic'] ?? '',
        uid: map['uid'] ?? '',
        isOnline : map['isOnline'] ?? false,
        phoneNumber: map['phoneNumber'] ?? '',
        groupId : List<String>.from(map['groupId']),
    );
  }
}