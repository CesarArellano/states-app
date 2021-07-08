class User {
  final String name;
  final int age;
  final List<String>? professions;

  User({
    this.name = 'No name',
    this.age = 1,
    this.professions
  }); 

  User copyWith({
    String? name,
    int? age,
    List<String>? professions
  }) => User(
    name: name ?? this.name,
    age: age ?? this.age,
    professions:  professions ?? this.professions
  );
}