import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
class viewpage extends StatefulWidget {
  viewpage(this.doc,{Key? key}) : super(key: key);
  Map<String,dynamic> doc;

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  final img='assests/A_black_image.jpg';
  final img5='assests/A_black_image.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 25.0,
        title:Container(

          child: Row(

            children: const [
              SizedBox(width: 10,),
              Icon(Icons.add_shopping_cart),
              SizedBox(width: 10,),
              Text("Products Profile")
            ],
          ),
        ),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),


      ),
      body:Container(
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage(img5))),
        child:SingleChildScrollView(

          child:Padding(

            padding: const EdgeInsets.all(10.0),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const SizedBox(height: 30,),

                if(widget.doc['ipath']=="") Center(
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage(img),
                  ),
                ),
                if(widget.doc['ipath']!="")Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(widget.doc['ipath']),
                    )
                ),

                const SizedBox(height: 40,),
                Center(
                  child:Container(
                    width: 308,
                    decoration: BoxDecoration(border: Border.all(width: 2.0),borderRadius: BorderRadius.circular(12.0)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                        Text("Name: ${widget.doc['name']}",
                          style:GoogleFonts.notoSansHanunoo(color: Colors.black,fontSize:20),
                          overflow: TextOverflow.fade,
                        )


                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child:Container(
                    width: 308,
                    decoration: BoxDecoration(border: Border.all(width: 2.0),borderRadius: BorderRadius.circular(12.0)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.location_city)),
                        Text("Location: ${widget.doc['location']}",
                          style:GoogleFonts.notoSansHanunoo(color: Colors.black,fontSize:20),
                          overflow: TextOverflow.fade,),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child:Container(
                    width: 308,
                    decoration: BoxDecoration(border: Border.all(width: 2.0),borderRadius: BorderRadius.circular(12.0)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.numbers_outlined)),
                        Text("Price: ${widget.doc['price']}",
                          style:GoogleFonts.notoSansHanunoo(color: Colors.black,fontSize:20),
                          overflow: TextOverflow.fade,),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child:Container(
                    width: 308,
                    decoration: BoxDecoration(border: Border.all(width: 2.0),borderRadius: BorderRadius.circular(12.0)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.bar_chart_outlined)),
                        Text("Quantity: ${widget.doc['Quantity']}",
                          style:GoogleFonts.notoSansHanunoo(color: Colors.black,fontSize:20),
                          overflow: TextOverflow.fade,),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 400,),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
