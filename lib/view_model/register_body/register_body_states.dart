abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}
class PasswordVisibilityIconChange extends RegisterStates{}
class CreateUserSuccessState extends RegisterStates{}
class CreateUserErrorState extends RegisterStates{
  final String error;
  CreateUserErrorState(this.error);
}


