class LoginModel {
  String usn;
  int sem;
  String section;
  LoginModel({required this.sem, required this.section, required this.usn});
}

LoginModel user1 = LoginModel(sem: 5, section: 'a', usn: "1rn21cs059");
LoginModel user2 = LoginModel(sem: 4, section: "c", usn: "1rn21cs149");

List<LoginModel> userList = [user1, user2];
