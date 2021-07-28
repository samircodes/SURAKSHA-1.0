import 'package:flutter/material.dart';
import 'package:suraksha/Screens/first_page.dart';




import 'package:suraksha/models/task.dart';

import 'package:suraksha/widgets/contactService.dart';

class ContactDetails extends StatefulWidget {
 ContactDetails({this.index, this.context,this.tasks,this.name, this.number});
  final String name;
  final int number;
  final int index;
  final BuildContext context;
  final List<Task> tasks;





  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}


    


class _ContactDetailsState extends State<ContactDetails> {




var contact;
    var task=Task();
    var _contactService =ContactService();
    TextEditingController _contactName =TextEditingController();
    TextEditingController _contactNumber =TextEditingController();




getAllContacts() async {
    var contacts = await _contactService.readContact();
    contacts.forEach((taskss) {
      setState(() {
        var taskModel = Task();
        taskModel.id = taskss['id'];
        taskModel.name = taskss['name'];
        taskModel.number = taskss['number'];
        widget.tasks.add(taskModel);
      });
    });
   
  }





     _editContact(BuildContext context, contactId) async{
contact= await _contactService.readContactById(contactId);
setState(() {
  _contactName.text=contact[0]['name']??'No Name';
 _contactNumber.text =contact[0]['number'].toString()??'No Number';
});
_editFormDialog(context) ;
    }




    _editFormDialog(BuildContext context){
      return showDialog(context: context,barrierDismissible: true, builder: (param){
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              color: Colors.red,
              onPressed: ()=>Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FlatButton(
              color: Colors.blue,
              child: Text('Update'),
              onPressed: () async{
                task.id =contact[0]['id'];
task.name=_contactName.text;
task.number=int.parse(_contactNumber.text);
                var result = await _contactService.updateContact(task);
                if(result>0){
                      print(result);
                 
                
                   Navigator.pop(context);
                    getAllContacts();
                    widget.tasks.length=0;
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstPage()));
                
                
                
                
                }
               
               
              },
            )
          ],
          title: Text('Edit Contact'),
          content: SingleChildScrollView(
            child: Column(
              children: [
TextField(
  
  controller: _contactName,
  keyboardType: TextInputType.name,
  decoration: InputDecoration(
    hintText: 'Name',
    labelText: 'Name'
  ),
),
TextField(
  controller: _contactNumber,
   keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: 'Contact Number',
 labelText: 'Contact Number'
  ),
),
              ],
            ),
          ),
        );
      });
    }

  


_deleteFormDialog(BuildContext context, contactId){
      return showDialog(context: context,barrierDismissible: true, builder: (param){
        return AlertDialog(
          actions: <Widget>[
            
            FlatButton(
              color: Colors.red,
              child: Text('Delete'),
              onPressed: () async{
                
                var result = await _contactService.deleteContact(contactId);
                if(result>0){
                      print(result);
               Navigator.pop(context);
                getAllContacts();
                    widget.tasks.length=0;
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstPage()));
                
                }

              },
            ),
            FlatButton(
              color: Colors.green,
              onPressed: ()=>Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
          title: Text('Are you sure You want to delete this contact!'),
          
        );
      });
    }

  






  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Colors.white,
      shadowColor: Colors.grey[900],
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name:- ',
                        style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 20,
                            fontFamily: 'Courgette'),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 20,
                            fontFamily: 'Courgette'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Contact:- ',
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 20,
                              fontFamily: 'Courgette')),
                      Text(widget.number.toString(),
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 20,
                              fontFamily: 'Courgette')),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                       _editContact(widget.context, widget.tasks[widget.index].id);
                       
                    },
                      child: Icon(
                    Icons.edit,
                    color: Colors.blue[900],
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (){
                      _deleteFormDialog(widget.context,widget.tasks[widget.index].id);
                     
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

