import 'contact.dart';

class Transactions {
  final String id;
  final String email;
  final String avatarUrl;
  final double value;
  final Contact contact;

  Transactions(
    this.id,
    this.value,
    this.contact,
    this.email,
    this.avatarUrl,
  );

  Transactions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        avatarUrl = json['avatarUrl'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'avatarUrl': avatarUrl,
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{id: $id, email: $email, avatarUrl: $avatarUrl, value: $value, contact: $contact}';
  }
}
