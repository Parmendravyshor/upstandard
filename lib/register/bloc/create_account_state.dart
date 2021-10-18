part of 'create_account_bloc.dart';

enum RegistrationStatus { unknown,processing, sendingOTP,verifyingOTP,sentOTP, verifiedOTP,gotCurrentLocation, verifiedIdentity, failure, done , uploadingImage, uploadedImage}

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.registrationStatus = RegistrationStatus.unknown,
    this.createAccount,
    this.data
  });

   

 
  final RegistrationStatus registrationStatus;
  final CreateAccount createAccount;
  final Map data;


  CreateAccountState copyWith({
    RegistrationStatus registrationStatus,
    Map data,
  }) {
    return CreateAccountState(
      registrationStatus:registrationStatus ?? this.registrationStatus,
      createAccount: createAccount??this.createAccount,
      data: data??this.data
    
    );
  }

  @override
  List<Object> get props => [registrationStatus,createAccount, data];
}
