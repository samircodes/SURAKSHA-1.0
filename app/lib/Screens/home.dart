import 'package:flutter/material.dart';
import 'package:suraksha/Screens/addContact.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:suraksha/models/task.dart';
import 'package:suraksha/widgets/contactList.dart';
import 'package:suraksha/widgets/contactService.dart';
import 'package:sms/sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:audioplayers/audioplayers.dart';





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _contactService = ContactService();
  // var _tasks=Task();

  List<Task> _taskList = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SmsSender sender = new SmsSender();
  double latitude;
  double longitude;
  Color color = Colors.lightBlue[200];
  int i = 0;
  final player = AudioCache();
  AudioPlayer audioPlayer;

  void _playFile() async {
    audioPlayer = await player.loop('siren.mp3');
    setState(() {
      color = Colors.red[900];
    });

    showInSnackBar('played press again to stop it'); // assign player here
  }

  void _stopFile() {
    audioPlayer?.stop();
    setState(() {
      color = Colors.lightBlue[200];
    });
    showInSnackBar('Stopped');
    // stop the file like this
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  @override
  void initState() {
     getLocation();
    getAllContacts();
   
    super.initState();
  }

  getAllContacts() async {
    var contacts = await _contactService.readContact();
    contacts.forEach((task) {
      setState(() {
        var taskModel = Task();
        taskModel.id = task['id'];
        taskModel.name = task['name'];
        taskModel.number = task['number'];
        _taskList.add(taskModel);
      });
    });
  }

  _deleteAllFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                child: Text('Delete All'),
                onPressed: () async {
                  var result = await _contactService.deleteAllContact();
                  if (result > 0) {
                    print(result);
                    Navigator.pop(context);
                    showInSnackBar('deleted');
                    setState(() {
                      _taskList.length = 0;
                    });
                  }
                },
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
            ],
            title: Text('Are you sure You want to delete all the contacts!'),
          );
        });
  }

  void getLocation() async {
    
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                _taskList.length != 0
                    ? _deleteAllFormDialog(
                        context,
                      )
                    : showInSnackBar('No contact available for deletion');
              },
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Delete All',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ))),
        ],
        backgroundColor: Colors.lightBlue[200],
        title: Text(
          'Suraksha',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontStyle: FontStyle.italic,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[200],
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddContact()))
              .then((value) => {
                    getAllContacts(),
                    _taskList.length = 0,
                  });
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                flex: 15,
                child: (_taskList.length == 0)
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Be Safe With Our",
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'SawarabiMincho',
                                color: Colors.grey[600]),
                          ),
                          Text(
                            "Suraksha App",
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'SawarabiMincho',
                                color: Colors.grey[600]),
                          ),
                        ],
                      ))
                    : ContactList(
                        tasks: _taskList,
                      )),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () async {
                            setState(() {
                              i++;
                              print(i);
                            });
                            i % 2 != 0 ? _playFile() : _stopFile();
                          },
                          backgroundColor: color,
                          child: Image(
                            image: AssetImage('images/siren.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Center(
                        child: InkWell(
                      onTap: () {
                        _taskList.length != 0
                            ? setState(() {
                                String num = _taskList[0].number.toString();
                                FlutterPhoneDirectCaller.callNumber(num);
                                _taskList.forEach((element) {
                                  sender.sendSms(new SmsMessage(
                                      element.number.toString(),
                                      'I NEED HELP! Please reach ASAP to the location:- http://www.google.com/maps/place/$latitude,$longitude'));
                                  
                                  });
                                getLocation();
                              })
                            : showInSnackBar('Do Not have any contact');
                      },
                      child: Image(
                        image: AssetImage('images/help.png'),
                        height: 200,
                        width: 200,
                        alignment: Alignment.bottomCenter,
                      ),
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
