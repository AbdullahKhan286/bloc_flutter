import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryPicker);
    on<ClearImagePicker>(_clearPicker);
  }

  Future<void> _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    emit(state.copyWith(file: file));
  }

  Future<void> _galleryPicker(
      GalleryCapture event, Emitter<ImagePickerState> emit) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    emit(state.copyWith(file: file));
  }

  Future<void> _clearPicker(
      ClearImagePicker event, Emitter<ImagePickerState> emit) async {
    emit(state.copyWith(file: null));
  }
}
