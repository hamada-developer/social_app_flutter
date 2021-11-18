import 'dart:io';

import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_state.dart';

class EditCubit extends Cubit<EditState> {
  late ImagePicker _picker;
  late File _fileImageCover;
  late File fileImageCo = File('');
  late File _fileImageProfile;

  EditCubit() : super(InitialEditState());

  static EditCubit get(BuildContext context) => BlocProvider.of(context);

  void selectImageCover() async{
    _picker = ImagePicker();
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if(xFile == null) {
      emit(PickerImageCoverError('Error when select image Cover'));
      return ;
    }
    _fileImageCover = File(xFile.path);
    emit(PickerImageCoverSuccess());
  }
  void selectImageProfile() async{
    _picker = ImagePicker();
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if(xFile == null) {
      emit(PickerImageProfileError('Error when select image profile'));
      return ;
    }
    _fileImageProfile = File(xFile.path);
    emit(PickerImageProfileSuccess());
  }

  File get fileImageCover => _fileImageCover;
  File get fileImageProfile => _fileImageProfile;

}
