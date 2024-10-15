class Question {
  final String question;
  final int reponse;
  final String categorie;
  final int difficulte;

  Question({
    required this.question,
    required this.reponse,
    this.categorie = 'Général',
    this.difficulte = 1,
  });
}
