import 'package:flutter/material.dart';
import 'package:suraksha/models/task.dart';
import 'package:suraksha/widgets/contactDetails.dart';
class ContactList extends StatefulWidget {
  
  
  
  final List<Task> tasks;
  ContactList({this.tasks,});

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context ,index){
      
return ContactDetails(context: context,index: index,  tasks: widget.tasks,name: widget.tasks[index].name, number: widget.tasks[index].number,);
    },
    itemCount: widget.tasks.length,);
  }
}

