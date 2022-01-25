import 'package:image_picker/image_picker.dart';

abstract class AddPostState{}

class InitialAddPostState extends AddPostState{}
class SelectImagePostSuccess extends AddPostState{
  XFile xFile;
  SelectImagePostSuccess(this.xFile);
}
class SelectImagePostError extends AddPostState{
  String error;
  SelectImagePostError(this.error);
}
