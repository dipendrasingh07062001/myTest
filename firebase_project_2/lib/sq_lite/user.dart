// ignore_for_file: file_names

class User {
  final int? id;
  final String name;
  final String age;
  final String country;
  final String? email;

  User(int i, 
      { this.id,
      required this.name,
      required this.age,
      required this.country,
      this.email});

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        country = res["country"],
        email = res["email"];

  Map<String, Object?> toMap() {
    print(Map());
    return {'id':id,'name': name, 'age': age, 'country': country, 'email': email};
  }
}
