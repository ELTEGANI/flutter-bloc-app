abstract class SignUpEvent {
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent {
  final String userName;

  const UserNameEvent(this.userName);
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}

class RePasswordEvent extends SignUpEvent {
  final String rePassword;

  const RePasswordEvent(this.rePassword);
}
