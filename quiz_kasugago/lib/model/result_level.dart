class LevelResult {
  String getLevelResult(int correctAnswer) {
    if (correctAnswer >= 8) {
      return '春日、さとみつレベル';
    } else if (correctAnswer >= 5) {
      return '春日へもう少しレベル';
    } else {
      return '若林レベル';
    }
  }
}
