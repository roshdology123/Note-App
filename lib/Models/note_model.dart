class Note {
  final String id;
  final String title;
  final String content;

  Note({required this.id, required this.title, required this.content});

  // Serialize the Note object to a map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }
}
