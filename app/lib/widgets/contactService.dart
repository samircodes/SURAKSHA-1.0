import 'package:suraksha/database/crud.dart';
import 'package:suraksha/models/task.dart';

class ContactService {
  CRUD _crudData;
  ContactService(){
    _crudData=CRUD();
  }

  //insert data
  saveContact(Task task) async{
    return await _crudData.insertData('contacts',task.taskMap());
  }

  readContact() async{
   return await _crudData.readData('contacts');
  }

  readContactById(itemId) async{
    return await _crudData.readDataById('contacts', itemId);
  }

  updateContact(Task task) async{
return await _crudData.updateData('contacts',task.taskMap());
  }

  deleteContact(contactId) async {
return await _crudData.deleteData('contacts',contactId);
  }

  deleteAllContact() async{
    return await _crudData.deleteAllData('contacts');
  }
}