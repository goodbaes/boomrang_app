part of 'app_localization.dart';

enum ALKeys {
  error,
  onward,
  phoneNumber,
  codeForSms,
  male,
  female,
  yourName,
  email,
  dateOfBirth,
  chooseGender,
  selectOrTakePhoto,
  thisFieldCannotBeEmpty,
  wrongDateOfBirth,
  unknownError,
  errorUploadPhoto,
  camera,
  gallery,
  profile,
  fullName,
  contact,
  fromYou,
  meterFirstVar,
  meterSecondVar,
  meterThirdVar,
  noOneLeft,
  looksLikeYouLookedAllPeopleInApp,
  tryAgain,
  datingCommunication,
  newAcquaintances,
  messages,
}

extension EnumToString on ALKeys {
  String get name => ALKeys.values[index].toString().split('.').last;
}

extension LocalizationWithGetX on ALKeys {
  String get tr => ALKeys.values[index].toString().split('.').last.tr;
}

extension MetersToString on num {
  String get trMeters {
    final lastNum = toInt().toString().split('').last;
    if ('056789'.contains(lastNum)) {
      return ALKeys.meterFirstVar.tr;
    } else if ('1' == lastNum) {
      return ALKeys.meterSecondVar.tr;
    } else {
      return ALKeys.meterThirdVar.tr;
    }
  }
}
