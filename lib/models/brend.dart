class Brend {
  final String id, name, image;

  Brend({required this.id, required this.name, required this.image});

  factory Brend.defaultBrend() {
    return Brend(id: '', name: '', image: '');
  }

  factory Brend.fromJson(Map<String, dynamic> json) {
    return Brend(id: json['id'], name: json['name'], image: json['image']);
  }
}
