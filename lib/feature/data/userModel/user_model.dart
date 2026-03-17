class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String city;
  final String avatarUrl;
  final String phone;
  UserModel({required this.id, required this.firstName, required this.lastName, required this.email, required this.city, required this.avatarUrl, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json["_id"],
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"],
        city: json["phone"]??"",
        avatarUrl: json["avatar_url"]??"",
        phone: json["city"]??""
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "_id":id,
      "first_name":firstName,
      "last_name":lastName,
      "email":email,
      "phone":phone,
      "avatar_url":avatarUrl,
      "city":city
    };
  }

}