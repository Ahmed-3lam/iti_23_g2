import 'package:bloc/bloc.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  int updateIndex = -1;

  void getNotes() async {
    emit(NoteLoading());
    try {
      await HiveHelper.getNotes();
      emit(NoteGetSuccess());
    } catch (e) {
      emit(NoteError());
    }
  }

  void updateNote(int index, String text) async {
    emit(SingleNoteLoading());
    await HiveHelper.updateNote(index, text);
    emit(NoteGetSuccess());
  }

  void removeNote(
    int index,
  ) {
    HiveHelper.removeNote(index);
    emit(NoteGetSuccess());
  }

  void removeAllNotes() {
    HiveHelper.removeAllNotes();
    emit(NoteGetSuccess());
  }

  void addNote(String text) {
    HiveHelper.addNote(text);
    ;
    emit(NoteGetSuccess());
  }
}
