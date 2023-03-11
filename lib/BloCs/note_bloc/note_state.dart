part of 'note_bloc.dart';

@immutable
class NoteState {
  final List<Note> notes;

  NoteState({required this.notes});

  factory NoteState.initial() {
    return NoteState(notes: []);
  }

  NoteState copyWith({List<Note>? notes}) {
    return NoteState(notes: notes ?? this.notes);
  }
}
