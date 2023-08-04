import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class Product extends StatefulWidget {
  String name;
  Product({required this.name});
  @override
  State<Product> createState() => _ProductState(name);
}

class _ProductState extends State<Product> {
  // var snap1 = FirebaseFirestore.instance.collection('vegetables').get();
  final List<int> _defaultValue = List.filled(10, 0);
  void _incrementCounter(int index, int value) {
    setState(() {
      _defaultValue[index] = value;
    });
  }

  String name;
  _ProductState(this.name);
  String uid = FirebaseAuth.instance.currentUser!.uid;
  // String n;
  @override
  Widget build(BuildContext context) {
    // bool f = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color.fromARGB(255, 30, 141, 98),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection(name).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 150),
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (_, index) {
              DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color.fromARGB(255, 249, 236, 236),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Image(
                              image: NetworkImage(snap['image']),
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${snap['name']}'),
                              Text('Price : ₹ ${snap['price']}'),
                              const Text('Quantity : 1kg'),
                              ElegantNumberButton(
                                initialValue: _defaultValue[index],
                                minValue: 0,
                                maxValue: snap['quantity'],
                                step: 1,
                                decimalPlaces: 1,
                                onChanged: (value) {
                                  // get the latest value from here
                                  setState(() {
                                    // _defaultValue[index] = value as int;
                                    int x = value as int;
                                    _incrementCounter(index, x);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {

                            // snap['quantity']=snap['quantity']-_defaultValue[index];
                            // var id=snapshot.data?.docs[index].reference.id;

                            FirebaseFirestore.instance
                                .collection('cart')
                                .doc(uid)
                                .collection('products')
                                .add({
                              "image": snap['image'],
                              "name": snap['name'],
                              "price": snap['price'],
                              "quantity": _defaultValue[index],
                              "total_price":
                                  snap['price'] * _defaultValue[index]
                            });
                            const snackBar =  SnackBar(
                              content:  Text('Added to cart'),
                              // action: SnackBarAction(
                              //   label: 'Undo',
                              //   onPressed: () {
                              //     // Some code to undo the change.
                              //   },
                            
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            // var collection =
                            //     FirebaseFirestore.instance.collection(name);
                            // collection
                            //     .doc(snap
                            //         .id) // <-- Doc ID where data should be updated.
                            //     .update({
                            //   "quantity":
                            //       snap['quantity'] - _defaultValue[index],
                            // });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 239, 119, 45)),
                          child: const Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



// GridView.builder(
//         physics: const ScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount:  1,
//           crossAxisSpacing: 12.0,
//           mainAxisSpacing: 10.0,
//           mainAxisExtent: 150
//         ),
//         itemCount: 10,
//         itemBuilder: (_, index) {
//           return Padding(
//             padding: const EdgeInsets.all(15),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.0),
//                 color: const Color.fromARGB(255, 249, 236, 236),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/veg.jpeg'),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text('Name'),
//                           Text('Price : 800'),
//                           Text('Quantity : 800gm'),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),