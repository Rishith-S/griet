import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floatingpanel/floatingpanel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seller_app/DataFetch/edit.dart';
import 'package:seller_app/DataFetch/input.dart';
import 'package:seller_app/DataFetch/view.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String uid=FirebaseAuth.instance.currentUser!.uid;
  String srch="";
  String dynamic1="completed";
  TextEditingController search=TextEditingController();
  List<String> list=["Edit","Delete"];

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:   AppBar(
          title:Text("Orders",
              style:TextStyle(
                  fontWeight: FontWeight.bold
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
            child:Icon(Icons.list_alt),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),
        ),
        body: Container(
            child: Stack(
                children: [
                  yourOrders(dynamic1),
                  FloatBoxPanel(
                      positionTop: MediaQuery.of(context).size.height - 400,
                      positionLeft: MediaQuery.of(context).size.width -100,
                      //initial position to bottom right aligned

                      backgroundColor: Colors.redAccent,
                      panelIcon: Icons.menu,
                      onPressed: (index){
                        //onpress action which gives pressed button index
                        print(index);
                        if(index == 0){
                            dynamic1 = "completed";
                            setState(() {
                            });

                        }else if(index == 1){
                              dynamic1="carted";
                              setState(() {

                              });
                        }else if(index == 2){
                            dynamic1="travelling";
                            setState(() {

                            });
                        }
                      },
                      buttons: [
                        // Add Icons to the buttons list.
                        Icons.offline_pin_rounded,
                        Icons.pending_actions,
                        Icons.mode_of_travel_rounded,
                      ]
                  ),
                ])
        )
    );
  }
  Widget yourOrders(String collection1){
    return Container(
        child:SingleChildScrollView(
          physics: ScrollPhysics(),
          child:Padding(
            padding: const EdgeInsets.only(right: 20,left: 10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  child:Center(child: Text(collection1.toUpperCase(),style:TextStyle(fontSize:25,fontWeight:FontWeight.bold ))
                ),),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(20.0) ),
                  child:TextField(
                    controller: search,
                    onChanged: (val) => {
                      setState((){
                        srch=val;
                      })
                    },
                    cursorColor: Colors.black87,
                    decoration:InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical:10.0 ,horizontal:10.0 ),
                      hintText: "Search",


                      suffixIcon: Icon(Icons.search_sharp),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(height: 35,),

                StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("sellers").doc(uid).collection("${collection1}").snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(),
                      );
                    }
                    if(snapshot.hasData){
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
                          if(srch.isEmpty){
                            return studentCard(data,(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> viewpage(data)));},collection1);
                          }
                          if(data['name'].toString().toLowerCase().contains(srch.toLowerCase())||
                              data['location'].toString().toLowerCase().contains(srch.toLowerCase())){
                            return studentCard(data,(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> viewpage(data)));},collection1);
                          }
                          return ColoredBox(color: Colors.white);

                        },
                        // shrinkWrap: true,
                        // children: snapshot.data!.docs.map((stid) => studentCard(stid,(){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> viewpage(stid)));
                        //   })).toList(),

                      );
                    }
                    return Text("No Details to View", style: GoogleFonts.nunito(fontSize: 17,color:Colors.black ),);
                  },
                ),

                SizedBox(height: 1000,)
              ],
            ),
          ),
        ),
    );
  }

  Widget studentCard(Map<String,dynamic> doct,Function()? onDoubleTap,collection1) {

    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child:Column(
        children:[
          Container(

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              child:
              ListTile(

                // decoration: BoxDecoration(
                //   color: Colors.black87,
                //
                //   borderRadius: BorderRadius.circular(8.0),
                // ) ,
                tileColor: Colors.teal,
                onTap: (){},
                selected: true,

                title: Text(
                  doct['name'],
                  style:GoogleFonts.notoSansHanunoo(color: Colors.black,fontWeight:FontWeight.bold),
                  overflow: TextOverflow.fade,
                ),
                subtitle: Column(
                  children: [
                    Text(
                        "Price: ${doct['price'].toString()}",
                        style:GoogleFonts.notoSansHanunoo(color: Colors.black),
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left
                    ),
                    Text(
                        "Location: ${doct['location']}",
                        style:GoogleFonts.notoSansHanunoo(color: Colors.black),
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left
                    ),
                  ],
                ),
                // decoration: UnderlineTabIndicator( insets: EdgeInsets.all(2.0)),
                leading:Container(
                  width: 90,
                  height: 90,
                  child:Row(
                    children: [
                      if(doct['ipath']=="")CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assests/images/A_black_image.jpg"),
                      ),
                      if(doct['ipath']!="")CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(doct['ipath']),

                      ),
                    ],
                  ),
                ),

                trailing:PopupMenuButton(itemBuilder: (context) {
                  return list.map((e) => PopupMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        if(e=="Edit")
                          Icon(Icons.edit,size: 30,color: Colors.black,),

                        if(e=="Delete")
                          Icon(Icons.delete,size: 30,color: Colors.black,),
                        SizedBox(width: 20,),
                        Text(e,style: GoogleFonts.archivoBlack(fontWeight: FontWeight.w400,color: Colors.black),)
                      ],
                    ),
                  )).toList();

                },
                  onSelected: (value){
                    if(value=="Edit"){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>editer(doct)));
                      setState(() {

                      });
                    }
                    else{
                      FirebaseFirestore.instance.collection("sellers").doc(uid).collection(collection1).doc(doct['docid']).delete();
                      setState(() {

                      });

                    }
                  },
                  icon: Icon(Icons.more_vert_sharp),
                  color: Colors.white,
                ),
              )
          ),

          SizedBox(height: 13,)
        ],
      ),
    );
  }
}

