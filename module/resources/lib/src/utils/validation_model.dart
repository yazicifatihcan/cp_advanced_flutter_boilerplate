class StringValidationModel {
  final bool allowEmpty;
  final String? pattern;
  final int? desiredLength;
  final int? minLength;
  final int? maxLength;
  final String? emptyErrorMessage;
  final String? patternErrorMessage;
  final String? desiredLengthErrorMessage;
  final String? lengthErrorMessage;

  StringValidationModel({
    this.desiredLength,
    this.allowEmpty = true,
    this.pattern,
    this.minLength,
    this.maxLength,
    this.patternErrorMessage,
    this.desiredLengthErrorMessage,
    this.lengthErrorMessage,
    this.emptyErrorMessage,
  });

  String? validateString(String input) {
    if (!allowEmpty && input.isEmpty) {
      return emptyErrorMessage;
    }

    if (desiredLength != null && input.length != desiredLength) {
      return desiredLengthErrorMessage;
    }

    if (minLength != null &&
        maxLength != null &&
        (input.length < minLength! || input.length > maxLength!)) {
      return lengthErrorMessage;
    }

    if (pattern != null && !RegExp(pattern!).hasMatch(input)) {
      return patternErrorMessage;
    }

    return null;
  }
}



// extension ValidationExtension on String {


//   String? isOTPCode({
//     String? lengthErrorMessage,
//     String? patternErrorMessage,
//     String? emptyErrorMessage,
//   }){
//     const String pattern=r'^[0-9]*$';
//     final RegExp regExp=RegExp(pattern);
//     if(length!=6){
//       return lengthErrorMessage ?? 'Must be 6 char';
//     }else if((!regExp.hasMatch(this))){
//       return patternErrorMessage ?? 'P';
//     }
//     return null;
//   }

//   //for validate phone numbers
//   String? isTelNo() {
//     const String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
//     final RegExp regExp = RegExp(pattern);
//     if (length == 0) {
//       return AppLocalization.getLabels.enterTelNoReqExMessage;
//     } else if (!regExp.hasMatch(this)) {
//       return AppLocalization.getLabels.enterValidTelNoReqExMessage;
//     }
//     return null;
//   }

//   //for validate activation code
//   String? isQRCode() {
//     const String pattern = r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$';
//     final RegExp regExp = RegExp(pattern);
//     if (length < 4 || length > 16 || !regExp.hasMatch(this)) {
//       return AppLocalization.getLabels.enterValidCodeReqExMessage;
//     }
//     return null;
//   }

//   //for validate name
//   String? isName() {
//     const String pattern =
//         r"^[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]+(([',. -][a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ])?[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]*)*$";
//     final RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return AppLocalization.getLabels.enterNameReqExMessage;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return AppLocalization.getLabels.enterValidNameReqExMessage;
//     }
//     return null;
//   }

//   //for validate name
//   String? isSurName() {
//     const String pattern =
//         r"^[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]+(([',. -][a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ])?[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]*)*$";
//     final RegExp regExp = RegExp(pattern);
//     if (isEmpty) {
//       return AppLocalization.getLabels.enterSurnameReqExMessage;
//     } else if (length == 1 || !regExp.hasMatch(this)) {
//       return AppLocalization.getLabels.enterValidSurnameReqExMessage;
//     }
//     return null;
//   }

//   String? isNotEmptyController() {
//     if (isEmpty) {
//       return AppLocalization.getLabels.requiredFieldReqExMessage;
//     }
//     return null;
//   }

//   String? isCreditCardNumber() {
//     if (isEmpty) {
//       return AppLocalization.getLabels.requiredFieldReqExMessage;
//     } else if (length < 16) {
//       return AppLocalization.getLabels.enterValidCardNoReqExMessage;
//     }
//     return null;
//   }

//   String? isCreditCardDate() {
//     if (isEmpty) {
//       return AppLocalization.getLabels.requiredFieldReqExMessage;
//     } else if (length < 4 || int.parse(substring(0, 2)) > 12 || int.parse(substring(2)) < 21) {
//       return AppLocalization.getLabels.enterValidDatReqExMessage;
//     }
//     return null;
//   }

//   String? isCreditCardCVV() {
//     if (isEmpty) {
//       return AppLocalization.getLabels.requiredFieldReqExMessage;
//     } else if (length < 3) {
//       return AppLocalization.getLabels.enterValidPasswordReqExMessage;
//     }
//     return null;
//   }
// }