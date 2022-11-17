abstract class Codable {
  final String? id;

  Codable(this.id);

  Map<String, dynamic> toJson();
}
