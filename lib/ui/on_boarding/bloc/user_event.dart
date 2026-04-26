abstract class UserEvent {}

class UserSignInEvent extends UserEvent {
  String email, password;
  UserSignInEvent({required this.email, required this.password});
}

class UserSignUpEvent extends UserEvent {
  String mobNo, name, email, password;
  UserSignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.mobNo,
  });


}
