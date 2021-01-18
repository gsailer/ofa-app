import 'package:flutter/material.dart';

//  This defines the DashBoard where you can import your JSON. After importing parsing begins.
//  TODO: Do I really need StatefulWidget?
class NoJSON extends StatefulWidget {
  NoJSON({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NoJSONState();
}
  
class _NoJSONState extends State<NoJSON> {

//  This Widget shows DashBoard with import option and note if the JSON is not imported yet.
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          // title: Text(widget.title) doesnt work. Try to give arguments in main.dart
          title: Text('OFA Prototype'),
        ),

        body: Center(
          child: Text("No data imported yet"),
        ),

        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(
            height: 50,)
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.insert_drive_file),
          onPressed: () => {
            //TODO: don't show loading before FileSystem appears, only after.
            Navigator.pushReplacementNamed(context, '/loadingJSON'),
          }
        ),
    );
  }
}