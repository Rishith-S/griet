import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seller_app/DataFetch/useredit.dart';

class User extends StatefulWidget {
  User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  var edit = Edit();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  var output;
  String? _currentAddress;
  Position? _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title:Text("User",
            style:TextStyle(
                fontWeight: FontWeight.bold
            )),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(140, 0, 0, 0),
          child:Icon(Icons.supervised_user_circle_outlined),
        ),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),
          actions: <Widget>[
        IconButton(
          icon: Icon(Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Edit()));
          },
        )
      ],

      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(uid)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                var output = snapshot.data!.data();
                return display(output!);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget display(Map<String, dynamic> doct) {
    return SingleChildScrollView(
      child: Container(
       // height:320,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [ 0.5 ],
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  // CircleAvatar(
                  //   backgroundColor: Colors.greenAccent.shade400,
                  //   minRadius: 35.0,
                  //   child: Icon(
                  //     Icons.call,
                  //     size: 30.0,
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    minRadius: 60.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(
                          'assests/images/circular_avatar.jpeg'),
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.lightBlueAccent,
                  //   minRadius: 35.0,
                  //   child: Icon(
                  //     Icons.message,
                  //     size: 30.0,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                doct['username'],
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                doct['Email'],
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40),
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Points',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doct['points'].toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doct['Location'],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Mobile Number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doct['Mobile number'],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
         ElevatedButton(onPressed: ()async{
           await _getCurrentPosition();
            await FirebaseFirestore.instance.collection("seller")
             .doc(uid)
             .set({
           'location': _currentAddress.toString()
         });
             setState(() {

             });
             }, child: Text("Update Location")
         ,      style: ElevatedButton.styleFrom(
               primary: Colors.black,
           ),
         ),
              SizedBox(height: 18,)
            ]
        ),

      ),
    );
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

}
