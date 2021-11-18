import 'dart:io' show File;

abstract class EditState {}

/*initial*/
class InitialEditState extends EditState {}

/*Cover Image States*/
class PickerImageCoverSuccess extends EditState {}

class PickerImageCoverError extends EditState {
  final String error;

  PickerImageCoverError(this.error);
}

/*Profile Image States*/
class PickerImageProfileSuccess extends EditState {}

class PickerImageProfileError extends EditState {
  final String error;

  PickerImageProfileError(this.error);
}
