class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"]);
  }
}

class Pet {
  final int id;
  final String name;
  final String category;
  final String location;
  final String image;
  final String sex;
  final int age;
  final num weight;
  final String description;

  Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.image,
    required this.sex,
    required this.age,
    required this.weight,
    required this.description,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      location: json["location"],
      image: json["image"],
      sex: json["sex"],
      age: json["age"],
      weight: json["weight"],
      description: json["description"],
    );
  }
}
