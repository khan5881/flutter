class LoginModel {
  final bool auth;
  final String token;
  // final Map<String,dynamic> user;

  LoginModel(this.auth, this.token);

  LoginModel.fromJson(Map<String, dynamic> json)
      : auth = json['auth'],
        token = json['token'];
        // user["user"]["firstname"] =json['firstname'];

  Map<String, dynamic> toJson() => {
        'auth': auth,
        'token': token,
      };
}
