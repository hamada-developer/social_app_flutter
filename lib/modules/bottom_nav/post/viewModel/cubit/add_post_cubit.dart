import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/post/viewModel/cubit/add_post_states.dart';

class AddPostCubit extends Cubit<AddPostState>{

  XFile? imagePost;
  AddPostCubit(): super (InitialAddPostState());

  static AddPostCubit get (BuildContext context)=> BlocProvider.of(context);

  void selectImagePost(){
    ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      emit(SelectImagePostSuccess(value!));
    }).catchError((onError){
      emit(SelectImagePostError(onError));
    });
  }
}