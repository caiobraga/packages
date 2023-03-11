abstract class Entity {
  final String id;

  Entity({required this.id});

  Map<String, dynamic> toJson();
}
