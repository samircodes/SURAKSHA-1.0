import 'package:flutter/material.dart';
import 'package:suraksha/models/task.dart';
import 'package:suraksha/widgets/contactService.dart';
class AddContact extends StatefulWidget {
 
  
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  
 
 String name;
    int number;
    var task=Task();
    var _contactService =ContactService();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact',style: TextStyle(
         
          fontSize: 27,
        ),),backgroundColor: Colors.lightBlue[200],
     
      centerTitle: true,),
      body: Container(
        color: Color(0xff757575),
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
          
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    name = newText;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 30),
                Text('Contact Number',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                TextField(
                  
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    onChanged: (newtext) {
                      number = int.parse(newtext);
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    keyboardType: TextInputType.number),
                TextButton(
                    onPressed: () async{
                      task.name=name;
                      task.number=number;
                      print(name);
                      print(number);
                      
                      
                      var result = await _contactService.saveContact(task);
                      print(result);
                     Navigator.pop(context);  
                      // Navigator.push(context, MaterialPageRoute(builder:(context)=>FirstPage()));
                      },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.lightBlue[200],
                          ),
                        ),
                      ),
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  