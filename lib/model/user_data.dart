class User {
  int user_id;
  String user_email;
  String user_password;
  String postalcode;

  User(this.user_id, this.user_email,this.user_password, this.postalcode);

  //
  factory User.fromJson(Map<String, dynamic> json) => User (
    json["user_id"] is int ? json["user_id"] : int.parse(json["user_id"]),
    json["user_email"],
    json["user_password"],
    json["postalcode"],
  );

  //convert userData to json
  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_email': user_email,
        'user_password': user_password,
        'postalcode': postalcode,
      };
}
