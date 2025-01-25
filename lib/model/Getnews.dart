class Getnews {
  final int id;
  final String title;
  final String body;

  // Constructor
  Getnews({
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory method untuk deserialisasi dari JSON
  factory Getnews.fromJson(Map<String, dynamic> json) {
    return Getnews(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
