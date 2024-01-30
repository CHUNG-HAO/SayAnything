class User {
  
  String name;
  String email;
  String aboutMeDescription;
  String gender;
  // Constructor
  User({
   
    required this.name,
    required this.email,
    required this.aboutMeDescription,
    required this.gender,
  });

  User copy({
    
    String? name,
    String? email,
    String? about,
    String? gender,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        aboutMeDescription: about ?? this.aboutMeDescription,
        gender: gender ?? this.gender,
      );

   static User fromJson(Map<String, dynamic> json) => User(
        
        name: json['name'],
        email: json['email'],
        aboutMeDescription: json['about'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'name': name,
        'email': email,
        'about': aboutMeDescription,
      };
}