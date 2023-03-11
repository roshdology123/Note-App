import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/note_model.dart';
import '../../Repository/note_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  NoteBloc({required this.noteRepository}) : super(NoteState.initial()) {
    on<LoadNotes>((event, emit) async {
      final notes = await noteRepository.streamNotes().first;
      emit(state.copyWith(notes: notes));
    });
    on<AddNote>((event, emit) async {
      await noteRepository.addNote(event.note);
      add(LoadNotes());
    });
  }

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is UpdateNote) {
      await noteRepository.updateNote(event.note);
      add(LoadNotes());
    } else if (event is DeleteNote) {
      await noteRepository.deleteNote(event.noteId);
      add(LoadNotes());
    }
  }
}
