import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  int cost = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('cart')
                .doc(uid)
                .collection('products')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return GridView.builder(
                
                physics:  ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 150),
                itemCount: (snapshot.data! as dynamic).docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot snap =
                      (snapshot.data! as dynamic).docs[index];
                    // cost = cost + (snap['total_price']) as int;

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
                              width: 130,
                              child: Image(
                                  image: NetworkImage(snap['image']),
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${snap['name']}'),
                                  Text('Price : ₹ ${snap['price']}'),
                                  Text('Quantity : ${snap['quantity']}'),
                                  Text('Total price : ${snap['total_price']}')
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('cart')
                                          .doc(uid)
                                          .collection('products')
                                          .doc(snap.id)
                                          .delete();
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // Text('Total Cost : $cost')
          TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Buy Now',
            style: TextStyle(color: Colors.white),
            ),

          )
        ],
      ),
    );
  }
}
