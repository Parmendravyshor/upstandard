part of 'create_account_bloc.dart';



abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}




class VerifyMe extends CreateAccountEvent {
  const VerifyMe(this.createAccount);

  final CreateAccount  createAccount ;

  @override
  List<Object> get props => [createAccount];
}

class VerifyOTP extends CreateAccountEvent {
  const VerifyOTP(this.createAccount);

  final CreateAccount  createAccount ;

  @override
  List<Object> get props => [createAccount];
}

class SendOTP extends CreateAccountEvent {
  // const SendOTP(this.createAccount);

  // final CreateAccount  createAccount ;

  @override
  List<Object> get props => [];
}

class UpdateUser extends CreateAccountEvent {
  const UpdateUser(this.createAccount);

  final CreateAccount  createAccount ;

  @override
  List<Object> get props => [createAccount];
}

class UploadImage extends CreateAccountEvent {
  const UploadImage(this.file);

  final String  file ;

  @override
  List<Object> get props => [file];
}









