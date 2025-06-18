class QuizPreguntas {
  const QuizPreguntas(this.text, this.respuesta);

  final String text;
  final List<String> respuesta;

  List<String> getShuffledRespuestas() {
    final shuffledList = List.of(respuesta);
    shuffledList.shuffle();
    return shuffledList;
  }
}
