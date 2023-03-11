import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/BloCs/note_bloc/note_bloc.dart';
import 'package:note_app/Repository/note_repository.dart';

import 'Screens/notes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final database = FirebaseFirestore.instance;
  database.settings = const Settings(persistenceEnabled: false);
  runApp(
    BlocProvider(
      create: (context) => NoteBloc(noteRepository: NoteRepository()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => NoteRepository(),
        child: BlocProvider(
          create: (context) =>
              NoteBloc(noteRepository: NoteRepository())..add(LoadNotes()),
          child: NotesScreen(),
        ),
      ),
    );
  }
}
