class Student {
  final String rollNumber;
  final List<int> marks;

  Student({required this.rollNumber, required this.marks});

  double get average => marks.isNotEmpty ? marks.reduce((a, b) => a + b) / marks.length : 0;
  double get percentage => (average / 100) * 100;

  String get feedback {
    if (percentage >= 85) return "Excellent";
    if (percentage >= 60) return "Good";
    if (percentage >= 50) return "Good";
    return "Needs Improvement";
  }
}
