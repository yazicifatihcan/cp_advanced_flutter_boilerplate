/// An interface used to create a validator class
/// you can also use it to create your own validation class
/// ```
/// class CustomClass implements IValidator {
///   final String message = 'Message to be used';
///
///   // you can mark the message prop as optional with [this.message]
///   CustomClass(this.message);
///
///   @override
///   bool call(String value) {
///     // should return true;
///     // return ("if meets my condition") ? false : true;
///     // this means if everything is good return false, no message needed to display otherwise return true to show the message
///   }
/// }
/// ```
/// ```
/// class CustomClass implements IValidator {
///   final String message = 'Message to be used';
///
///   // you can mark the message prop as optional with [this.message]
///   CustomClass(this.message);
///
///   @override
///   bool call(String value) {
///     // should return true;
///     // return ("if meets my condition") ? false : true;
///     // this means if everything is good return false, no message needed to display otherwise return true to show the message
///   }
/// }
/// ```
/// ```
/// class CustomClass implements IValidator {
///   final String message = 'Message to be used';
///
///   // you can mark the message prop as optional with [this.message]
///   CustomClass(this.message);
///
///   @override
///   bool call(String value) {
///     // should return true;
///     // return ("if meets my condition") ? false : true;
///     // this means if everything is good return false, no message needed to display otherwise return true to show the message
///   }
/// }
/// ```
/// ```
/// //USAGE
/// Form(
///      key: fKey,
///      child: TextFormField(
///      controller: cText,
///      validator: (String? value) => validate([
///        Required(message: 'This field is required'),
///        ])?.call(value),
///        ),
///       ),
/// ```
/// 
abstract class IValidator {
  ///Constructor
  IValidator(this.message);

  ///Message to show if condition doesnt met.
  final String message;

  ///Functino to call if given string is validate.
  bool call(String value);
}


/// Used to run the validators in sequence
/// this function must be used in the validate function
/// ```
/// TextFormField(
///   validator: validate([
///     Required('This field is required'),
///     Email('Please enter the email correctly'),
/// ]))
/// ```
String? Function(String?)? validate(List<IValidator> validators) {
  return (String? value) {
    if (value == null) {
      // Handle null value if needed
      return 'Value cannot be null';
    }

    for (final validator in validators) {
      if (validator(value)) {
        return validator.message;
      }
    }
    return null;
  };
}

/// Check if the field value contains a certain string
class Contains implements IValidator {
  ///Constructor
  Contains({required this.seed, required this.message});

  ///Base text to compare if main text contains.
  final String seed;

  ///Message to show if condition doesnt met.
  @override
  final String message;
  @override
  bool call(String value) => !value.contains(seed);
}

/// Check if the field value is equal to a certain string
class Equals implements IValidator {
  ///Constructor
  Equals({required this.seed, required this.message});

  ///Base text to compare if main text equals.
  final String seed;

  ///Message to show if condition doesnt met.
  @override
  final String message;
  @override
  bool call(String value) => seed != value;
}

/// Mark the field as required
class Required implements IValidator {
  ///Constructor
  Required({required this.message});

  ///Message to show if condition doesnt met.
  @override
  final String message;
  @override
  bool call(String value) => value.isEmpty;
}

/// Set the maximum amount of characters
class MaxLength implements IValidator {
  /// Constructor
  MaxLength({required this.limit, required this.message});

  ///Max limit to compare text
  final int limit;

  ///Message to show if condition doesnt met.
  @override
  final String message;
  @override
  bool call(String value) => value.length > limit;
}

/// Set the minimum amount of characters
class MinLength implements IValidator {
  ///Constructor
  MinLength({required this.limit, required this.message});

  ///Min limit to compare text
  final int limit;

  ///Message to show if condition doesnt met.
  @override
  final String message;
  @override
  bool call(String value) => value.length < limit;
}

/// Limit the field digits to be between a limited range
/// it uses MaxLength and MinLength validators
class Between implements IValidator {
  ///Constructor
  Between({required this.message, required int max, required int min})
      : maxLength = MaxLength(limit: max, message: message),
        minLength = MinLength(limit: min, message: message);

  ///Min Lenght to compare text
  final MinLength minLength;

  ///Min Lenght to compare text
  final MaxLength maxLength;

  ///Message to display if condition doesnt met
  @override
  final String message;
  @override
  bool call(String value) => maxLength(value) || minLength(value);
}

/// Compose multiple validators into one singular validator.
class Compose implements IValidator {
  ///Constructor
  Compose({required this.message, required this.validators});

  ///Message to display if condition doesnt met
  @override
  String message;

  ///List of validators to check
  final List<IValidator> validators;
  @override
  bool call(String value) {
    for (final validator in validators) {
      if (validator(value)) {
        message = validator.message;
        return true;
      }
    }
    return false;
  }
}

/// Indicate that the field should be an email
/// It uses a common regexp to validate the string, but you can use your own
class Email implements IValidator {
  ///Constructor
  Email({
    required this.message,
    String regexp = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  }) : pattern = RegExp(regexp);

  ///PAttern to check
  final RegExp pattern;

  ///Message to display if condition doesnt met
  @override
  final String message;
  @override
  bool call(String value) => !pattern.hasMatch(value);
}

/// Check if the field value matches the pattern
class PatternValidator implements IValidator {
  ///Constructor
  PatternValidator({required String regexb, required this.message})
      : regexp = RegExp(regexb);

  ///PAttern to check
  final RegExp regexp;

  ///Message to display if condition doesnt met
  @override
  final String message;
  @override
  bool call(String value) => !regexp.hasMatch(value);
}
