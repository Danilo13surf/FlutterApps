
class Contact {
  final int id;
  final String name;
  final String email;
  final int accountNumber;
  final String avatarUrl;

  Contact(
    this.id,
    this.name,
    this.email,
    this.accountNumber,
    this.avatarUrl,
  );

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, email: $email, accountNumber: $accountNumber, avatarUrl: $avatarUrl,}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        accountNumber = json['accountNumber'],
        avatarUrl = json['avatarUrl'];

  Map<String, dynamic> toJson() => {
        'is': id,
        'name': name,
        'email': email,
        'accountNumber': accountNumber,
        'avatarUrl': avatarUrl,
      };
}
