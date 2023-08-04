import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/products_screen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 204, 223, 204),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'vegetables',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/vegicon.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Vegetables',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'fruits',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/fruit.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Fruits',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  Product(name: 'others',)
                  )
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/rice.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Rice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  Product(name: 'others',)
                  )
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/dairy.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Dairy/Milk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Product(name: 'others',)
                    )
                  );
              },
              child: Column(
                children: [
                  Image.asset('assets/grains.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Grains/Cereals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'others',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/spices.jpeg',
                  height: 130,
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    'Spices',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'others',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/oilseeds.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Oils & OilSeeds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'others',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/coffee.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Coffe & Others',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Product(name: 'others',)
                            )
                          );
              },
              child: Column(
                children: [
                  Image.asset('assets/meat.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Meat & Poultry',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Product(name: 'others',)
                    )
                  );
              },
              child: Column(
                children: [
                  Image.asset('assets/others.jpeg',
                  height: 130,
                  ),
                  const Text(
                    'Others',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}