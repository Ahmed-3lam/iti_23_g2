part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}
class SingleNoteLoading extends NoteState {}

class NoteGetSuccess extends NoteState {}

class NoteError extends NoteState {}
