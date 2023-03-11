import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/note_model.dart';

class NoteRepository {
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Add a new Note to Firebase
  Future<void> addNote(Note note) async {
    await _notesCollection.doc(note.id).set(note.toMap());
  }

  // Update an existing Note in Firebase
  Future<void> updateNote(Note note) async {
    await _notesCollection.doc(note.id).update(note.toMap());
  }

  // Delete an existing Note from Firebase
  Future<void> deleteNote(String noteId) async {
    await _notesCollection.doc(noteId).delete();
  }

  // Stream all Notes from Firebase
  Stream<List<Note>> streamNotes() {
    return _notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Note(
          id: doc.id,
          title: doc['title'],
          content: doc['content'],
        );
      }).toList();
    });
  }
}
