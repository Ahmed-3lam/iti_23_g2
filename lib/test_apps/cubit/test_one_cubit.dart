import 'package:bloc/bloc.dart';
import 'package:iti_23_g2/const.dart';
import 'package:meta/meta.dart';

part 'test_one_state.dart';

class TestOneCubit extends Cubit<TestOneState> {
  TestOneCubit() : super(TestOneInitial());

  var image = avatarImage;

  changeImage() {

    if (image == avatarImage) {
      image = avatarImage2;
    } else {
      image = avatarImage;
    }

    emit(TestOneChangeImage());
  }
}
