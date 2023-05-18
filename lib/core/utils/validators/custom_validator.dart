abstract class CustomValidator<T> {
  String? validate(T? value, {String? message});
}

abstract class CustomValidatorWithOldValue<T> {
  String? validate(
    T? value, {
    required T oldValue,
    String? message,
  });
}
