class RegisterModel {
  final String email;
  final String fname;
  final String lname;
  final String passwordHash;
  final String espId1;
  final String espId2;

  RegisterModel(
      this.email, this.fname, this.lname, this.espId1, this.espId2, this.passwordHash);

  RegisterModel.fromJson(Map<String, dynamic> json)
      : fname = json['firstName'],
        lname = json['lastName'],
        email = json['email'],
        espId1 = json['espID'],
        espId2 = json['espID'],
        passwordHash = json['passwordHash'];

  Map<String, dynamic> toJson() => {
        'firstName': fname,
        'lastName': lname,
        'email': email,
        'passwordHash': passwordHash,
        'espId': espId1,
      };
}
