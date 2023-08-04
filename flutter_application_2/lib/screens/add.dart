// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Show extends StatefulWidget {
//   const Show({super.key});

//   @override
//   State<Show> createState() => _ShowState();
// }

// class _ShowState extends State<Show> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//             physics: const ScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 12.0,
//                 mainAxisSpacing: 10.0,
//                 mainAxisExtent: 150),
//             itemCount: (snapshot.data! as dynamic).docs.length,
//             itemBuilder: (_, index) {
//               DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];
//               return Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     color: const Color.fromARGB(255, 249, 236, 236),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: Image(
//                               image: NetworkImage(snap['image']),
//                               fit: BoxFit.cover),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('${snap['name']}'),
//                               Text('Price : ₹ ${snap['price']}'),
//                               const Text('Quantity : 1kg'),
//                               ElegantNumberButton(
//                                 initialValue: _defaultValue[index],
//                                 minValue: 0,
//                                 maxValue: snap['quantity'],
//                                 step: 1,
//                                 decimalPlaces: 1,
//                                 onChanged: (value) {
//                                   // get the latest value from here
//                                   setState(() {
//                                     // _defaultValue[index] = value as int;
//                                     int x = value as int;
//                                     _incrementCounter(index, x);
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // snap['quantity']=snap['quantity']-_defaultValue[index];
//                             // var id=snapshot.data?.docs[index].reference.id;

//                             FirebaseFirestore.instance
//                                 .collection('cart')
//                                 .doc(uid)
//                                 .collection('products')
//                                 .add({
//                               "image": snap['image'],
//                               "name": snap['name'],
//                               "price": snap['price'],
//                               "quantity": _defaultValue[index],
//                               "total_price":
//                                   snap['price'] * _defaultValue[index]
//                             });
//                             var collection =
//                                 FirebaseFirestore.instance.collection(name);
//                             collection
//                                 .doc(snap
//                                     .id) // <-- Doc ID where data should be updated.
//                                 .update({
//                               "quantity":
//                                   snap['quantity'] - _defaultValue[index],
//                             });
//                           },
//                           style: TextButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 239, 119, 45)),
//                           child: const Text(
//                             'Add',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );;
//   }
// }