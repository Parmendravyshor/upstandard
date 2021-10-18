import 'package:formz/formz.dart';

enum PinValidationError { empty }

class Pin extends FormzInput<String, PinValidationError> {
  const Pin.pure() : super.pure('');
  const Pin.dirty([String value = '']) : super.dirty(value);

  @override
  PinValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : PinValidationError.empty;
  }
}
