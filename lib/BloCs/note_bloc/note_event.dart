part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;

  AddNote({required this.note});
}

class UpdateNote extends NoteEvent {
  final Note note;

  UpdateNote({required this.note});
}

class DeleteNote extends NoteEvent {
  final String noteId;

  DeleteNote({required this.noteId});
}
