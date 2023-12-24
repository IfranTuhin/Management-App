class LoginModel{

  String ? id;
  String ? name;
  String ? email;
  String ? password;

  LoginModel(this.id, this.name, this.email, this.password);

  LoginModel.fromJson(Map map){
    id = map["id"];
    name = map["name"];
    email = map["email"];
    password = map["password"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'id' : id,
      'name' : name,
      'email' : email,
      'password' : password,
    };
    return map;
  }

}