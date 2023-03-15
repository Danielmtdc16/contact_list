import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:contact_list/constantes.dart';
import 'package:contact_list/models/contact.dart';
import 'dart:async';

class ContactHelper{

  Contact contact = Contact();

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async{
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database? dbContact = await db;
    contact.id = await dbContact!.insert(contactTable, contact.toMap() as Map<String, dynamic>);
    print("salvei");
    return contact;

  }

  Future<Contact?> getContact(int id) async {
    Database? dbContact = await db;
    List<Map> maps = await dbContact!.query(contactTable,
      columns: [idColumn, nameColumn, emailColumn, phoneColumn, imgColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);

    if (maps.isNotEmpty){
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database? dbContact = await db;
    return await dbContact!.delete(
      contactTable,
      where: "$idColumn = ?",
      whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    Database? dbContact = await db;
    return await dbContact!.update(
      contactTable,
      contact.toMap() as Map<String, dynamic>,
      where: "$idColumn = ?",
      whereArgs: [contact.id]
    );
  }

  Future<Map<String, List<Contact>>> getAllContacts() async {
    Database? dbContact = await db;
    List listMap = await dbContact!.rawQuery("SELECT * FROM $contactTable");
    List<Contact> listContact = [];
    Map<String, List<Contact>> lettersContacts = {};
    List<Contact> temporaryContacts = [];
    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }
    for (int letter = 0; letter < kletters.length; letter++){
      for (int contact = 0; contact < listContact.length; contact++){
        if (listContact[contact].name != null) {
          if (listContact[contact].name![0].toUpperCase() == kletters[letter]) {
            temporaryContacts.add(listContact[contact]);
          }
        }
      }
      if (temporaryContacts.isNotEmpty) {
        lettersContacts[kletters[letter]] = temporaryContacts;
      }
      temporaryContacts = [];
    }

    return lettersContacts;
  }

  Future<int> getNumber() async {
    Database? dbContact = await db;
    return Sqflite.firstIntValue(await dbContact!.rawQuery("SELECT COUNT(*) FROM $contactTable"))!;
  }

  Future  close() async {
    Database? dbContact = await db;
    dbContact!.close();
  }
  
  void deleteAll() async {
    Database? dbContact = await db;
    dbContact!.delete(contactTable, where: "$idColumn != -1");
  }
}
