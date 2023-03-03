import 'package:contact_list/constantes.dart';

class Contact {

  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;
  Contact();
  Contact.fromMap(Map map){
    id = map["idColumn"];
    name = map["nameColumn"];
    email = map["emailColumn"];
    phone = map["phoneColumn"];
    img = map["imgColumn"];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };

    if (id != null){
      map[idColumn] = id;
    }
    return map;
  }
}