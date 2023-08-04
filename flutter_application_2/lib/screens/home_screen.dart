import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/const/list.dart';
import 'package:flutter_application_2/screens/products_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // color: const Color.fromRGBO(239, 239, 239, 1),
      color: const Color.fromARGB(255, 204, 223, 204),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              // color: const Color.fromARGB(255, 244, 241, 241),
              color: const Color.fromARGB(255, 204, 223, 204),
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  hintText: 'Search',
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(onPressed: (){
                    if(searchcontroller.text=="vegetables" || searchcontroller.text=="vegetable"){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(
                                    name: 'vegetables',
                                  )));
                    }
                    else if(searchcontroller.text=="fruits" || searchcontroller.text=="fruit"){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(
                                    name: 'fruits',
                                  )));
                    }
                    else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(
                                    name: 'others',
                                  )));
                    }
                  }, icon:const Icon(Icons.search)),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //swiper

            VxSwiper.builder(
                // aspectRatio: 16 / 9,
                autoPlay: true,
                // autoPlayInterval: ,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                enlargeCenterPage: true,
                // enableInfiniteScroll: false,
                height: 250,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    brandimgs[index],
                    width: 1000,
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .make();
                }),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 120,
                  width: 100,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Product(
                                      name: 'vegetables',
                                    )));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/vegicon.jpeg'),
                          const Text(
                            'Vegetables',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 120,
                  width: 100,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Product(
                                      name: 'fruits',
                                    )));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/fruiticon.png',
                            height: 70,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Fruits',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 123,
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(
                                    name: 'others',
                                  )));
                    },
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Product(
                                        name: 'others',
                                      )));
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/riceicon.jpeg'),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Rice',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
