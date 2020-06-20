class LoginModel {
  String name;
  String email;

  LoginModel({
    this.name,
    this.email
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'email': this.email,
  };
}