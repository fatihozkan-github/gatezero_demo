import '../services/service_localization.dart';
import 'utilities_general.dart';

class FormUtils {
  static none(value) => null;

  static dynamic notEmpty(String typedValue) {
    if (!GeneralUtils.hasData(typedValue)) {
      return LocalizationService.texts.cannotBeLeftEmptyAlert;
    } else {
      return null;
    }
  }

  static dynamic phone(String typedValue) {
    return !GeneralUtils.hasData(typedValue)
        ? LocalizationService.texts.cannotBeLeftEmptyAlert
        : GeneralUtils.isValidPhoneNumber(typedValue)
            ? null
            : LocalizationService.texts.phoneValidationAlert;
  }

  static dynamic mail(String typedValue) {
    return !GeneralUtils.hasData(typedValue)
        ? LocalizationService.texts.cannotBeLeftEmptyAlert
        : GeneralUtils.isValidEmail(typedValue)
            ? null
            : LocalizationService.texts.invalidEmailAlert;
  }

  static dynamic password(String typedValue) {
    if (!GeneralUtils.hasData(typedValue)) {
      return LocalizationService.texts.cannotBeLeftEmptyAlert;
    } else if (typedValue.length < 6) {
      return LocalizationService.texts.passwordTooShortAlert;
    } else {
      return null;
    }
  }
}
