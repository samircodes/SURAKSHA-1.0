import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  var path;
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
     path =join(directory.path,'contactsDatabase.db');
    var database = await openDatabase(path,version: 1,onCreate:_onCreatingDatabase );
    return database;

  }
  


  _onCreatingDatabase(Database database, int version) async{
await database.execute("CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, number INTEGER NOT NULL)");
  }
}