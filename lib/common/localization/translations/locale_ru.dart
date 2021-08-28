part of '../app_localization.dart';

class LocaleRU extends BaseLocale {
  const LocaleRU();

  @override
  Locale get locale => const Locale('ru', 'RU');

  @override
  Map<ALKeys, String> get translateMap => {
        ALKeys.error: 'Ошибка',
        ALKeys.onward: 'Далее',
        ALKeys.phoneNumber: 'Номер телефона',
        ALKeys.codeForSms: 'Код из СМС',
        ALKeys.male: 'Мужской',
        ALKeys.female: 'Женский',
        ALKeys.yourName: 'Ваше имя',
        ALKeys.email: 'E-mail',
        ALKeys.dateOfBirth: 'Дата рождения',
        ALKeys.chooseGender: 'Выберите пол',
        ALKeys.selectOrTakePhoto: 'Выберите или сделайте фото',
        ALKeys.thisFieldCannotBeEmpty: 'Это поле не может быть пустым',
        ALKeys.wrongDateOfBirth: 'Не верная дата',
        ALKeys.unknownError: 'Неизвестная ошибка',
        ALKeys.errorUploadPhoto: 'Ошибка загрузки фото',
        ALKeys.camera: 'Камера',
        ALKeys.gallery: 'Галлерея',
        ALKeys.profile: 'Профиль',
        ALKeys.fullName: 'Полное имя',
        ALKeys.contact: 'Contact',
        ALKeys.fromYou: 'От вас',
        ALKeys.meterFirstVar: 'Метров',
        ALKeys.meterSecondVar: 'Метр',
        ALKeys.meterThirdVar: 'Метра',
        ALKeys.noOneLeft: 'Никого не осталось',
        ALKeys.looksLikeYouLookedAllPeopleInApp:
            'Похоже Вы посмотрели\nвсех людей в приложении',
        ALKeys.tryAgain: 'Попробовать заново',
        ALKeys.datingCommunication: 'Знакомства и общение',
        ALKeys.newAcquaintances: 'Новые знакомства',
        ALKeys.messages: 'Сообщения',
      };
}
