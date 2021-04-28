import 'package:newtopbytebank/database/app_database.dart';
import 'package:newtopbytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_accountNumber INTEGER, '
      '$_avatarUrl TEXT) ';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _accountNumber = 'accountNumber';
  static const String _avatarUrl = 'avatarUrl';

  Future<int> saveDB(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAllDB() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_email] = contact.email;
    contactMap[_accountNumber] = contact.accountNumber;
    contactMap[_avatarUrl] = contact.avatarUrl;

    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_email],
        row[_accountNumber],
        row[_avatarUrl],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  Future<int> updateDB(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _tableName,
      contactMap,
      where: '$_id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteDB(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }
}
