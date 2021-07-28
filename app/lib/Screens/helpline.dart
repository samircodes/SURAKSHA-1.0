import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HelplinePage extends StatefulWidget {
  @override
  _HelplinePageState createState() => _HelplinePageState();
}

class _HelplinePageState extends State<HelplinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.lightBlue[200],
        title: Text(
          'Emercency Contacts',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontStyle: FontStyle.italic,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/police.png'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Police',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text('100', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('100'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/women.png'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Women Helpline',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text('1091', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('1091'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/womenAbuse.jpg'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Women Helpline',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  '(Domestic Abuse)',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text('181', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('181'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/ambulance.png'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Ambulance',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text('102', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('102'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/emergency.png'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'National Emergency',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  ' Number',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text('112', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('112'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/child.png'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Child Helpline',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text('1098', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('1098'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/fire.jpg'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Fire',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text('101', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('101'),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  child: Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/road.jpg'),
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Road',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  'Accident Emergency',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  'Helpline',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text('1073', style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            InkWell(
                              child: Icon(Icons.call, size: 40),
                              onTap: () =>
                                  FlutterPhoneDirectCaller.callNumber('1073'),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            );
          }),
    );
  }
}
