import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
class editer extends StatefulWidget {
  editer(this.doc,{Key? key}) : super(key: key);
  Map<String,dynamic> doc;

  @override
  State<editer> createState() => _editerState();
}
// "name":name.text,
// "email":email.text,
// "roll_no":rollno.text,
// "ipath":path,
class _editerState extends State<editer> {
  String uid=FirebaseAuth.instance.currentUser!.uid;
  String docid1="";
  String path="";
  String url1="";
  String imgname1="";
  TextEditingController name=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController price=TextEditingController();
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  final img='assets/prof.jpg';
  final log1='assets/log1.jpg';
  String imgurldel="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name=TextEditingController(text: widget.doc['name']);
    location=TextEditingController(text: widget.doc['location']);
    price=TextEditingController(text: widget.doc['price'].toString());
    path=widget.doc['ipath'];
    url1=widget.doc['ipath'];
    imgurldel=widget.doc['ipath'];
    docid1=widget.doc['docid'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black87,

        title:Container(

          child: Row(

            children: const [

              Icon(Icons.person_add_alt_1_outlined),
              SizedBox(width: 10,),
              Text("Edit Product Details")
            ],
          ),
        ),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),


      ),
      body:Container(
        decoration: BoxDecoration(image: DecorationImage( alignment: Alignment.center,fit: BoxFit.cover,image: AssetImage(log1))),
        child:SingleChildScrollView(

          child:Padding(

            padding: const EdgeInsets.all(10.0),
            child:Form(
              key: formKey,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  const SizedBox(height: 30,),
                  Center(
                    child : Stack(

                        children:[
                          if(path=="")CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage(img) ,),
                          if(url1!="")CircleAvatar(
                            radius: 120,
                            backgroundImage: NetworkImage(url1),
                          ),
                          if(path!=""&&url1=="")CircleAvatar(
                            radius: 120,
                            backgroundImage: FileImage(File(path)) ,),


                          Positioned(
                            bottom: 22,
                            right: 20,

                            child:CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child:IconButton(
                                  icon: Icon(Icons.camera_enhance,color: Colors.tealAccent),
                                  color: Colors.white,

                                  visualDensity: VisualDensity.adaptivePlatformDensity,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: ((builder)=>bottomsheet()) ,
                                    );
                                  },

                                )

                            ),
                          ),
                        ]
                    ),

                  ),
                  const SizedBox(height: 40,),
                  Center(
                    child:Container(
                      width: 308,
                      decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 2.0) ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child:SizedBox(
                              width:260,
                              child:TextFormField(
                                textAlign: TextAlign.start,
                                controller: name,
                                decoration: const InputDecoration(
                                    hintText: 'Name',
                                    prefixIcon: Icon(Icons.perm_identity),
                                    border: InputBorder.none
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))

                                ),
                                validator: (value) {
                                  if(value!.isEmpty||!RegExp(r'^[a-z A-z]+$').hasMatch(value!)){
                                    return "Enter a valid Name";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              name=TextEditingController(text: "");
                            });
                          },
                              icon: Icon(Icons.clear_sharp))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child:Container(
                      width: 308,
                      decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 2.0) ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child:SizedBox(
                              width:260,
                              child:TextFormField(
                                textAlign: TextAlign.start,
                                controller: location,
                                decoration: const InputDecoration(
                                    hintText: 'Loaction',
                                    prefixIcon: Icon(Icons.location_city),
                                    border: InputBorder.none
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))

                                ),
                                validator: (value) {
                                  if(value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                                    return "Enter a valid Loaction";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              location=TextEditingController(text: "");
                            });
                          },
                              icon: Icon(Icons.clear_sharp)
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child:Container(
                      width: 308,
                      decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 2.0) ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child:Container(
                              width:260 ,

                              child:TextFormField(
                                textAlign: TextAlign.start,
                                controller: price,
                                decoration: const InputDecoration(
                                  hintText: 'Price',
                                  prefixIcon: Icon(Icons.numbers_outlined),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if(value!.isEmpty||!RegExp(r'^[0-9]+$').hasMatch(value!)){
                                    return "Enter a valid price";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              price=TextEditingController(text: "");
                            });
                          },
                              icon: Icon(Icons.clear_sharp))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[

                        FloatingActionButton.extended(
                          label: const Text("clear"),
                          backgroundColor: Colors.black,
                          elevation: 10.0,
                          extendedPadding: EdgeInsets.all(40.0),
                          onPressed: (){
                            setState(() {
                              name=TextEditingController(text: "");
                              location=TextEditingController(text: "");
                              price=TextEditingController(text: "");
                            });
                          },
                        ),

                        const SizedBox(width: 73,),
                        FloatingActionButton.extended(
                          label: Text("Submit"),
                          backgroundColor: Colors.black,
                          elevation: 10.0,
                          extendedPadding: EdgeInsets.all(40.0),
                          onPressed: ()async {
                            if(formKey.currentState!.validate()) {
                              if (path != "" && imgname1 != "") {
                                final iname = imgname1;
                                try {
                                  await FirebaseStorage.instance.ref(
                                      'pictures/$iname').putFile(File(path));
                                } on FirebaseException catch (e) {
                                  print(e);
                                }
                                String dt = await FirebaseStorage.instance.ref(
                                    'pictures/$iname').getDownloadURL();
                                setState(() {
                                  url1 = dt;
                                });
                              }
                              FirebaseFirestore.instance.collection("sellers").doc(uid).collection("products")
                                  .doc(docid1).update({
                                "name": name.text,
                                "loaction": location.text,
                                "price": price.text,
                                "ipath": url1,
                              })
                                  .then((value) {
                                Navigator.pop(context);
                              }).catchError((error) => print(
                                  "Failed to add new product due to $error"));
                            }
                          } ,

                        ),

                      ]
                  ),
                  SizedBox(height: 400,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget bottomsheet() {
    return Container(
      height: 125.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white70,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          if(path=="")FloatingActionButton.extended(
              label: Text("Camera"),
              onPressed:()async{
                final pick= await ImagePicker().pickImage(source:ImageSource.camera);
                if(pick==null){
                  Navigator.pop(context);
                  return;
                }
                else{
                  setState((){
                    url1="";
                    imgname1=pick.name;
                    path=pick.path;
                  });
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.camera),
              backgroundColor: Colors.black87
          ),
           if(path=="")SizedBox(width: 69.0,),
          if(path=="")FloatingActionButton.extended(
              label: Text("Gallery"),
              onPressed: ()async{
                final pick= await ImagePicker().pickImage(source:ImageSource.gallery);
                if(pick==null){
                  Navigator.pop(context);
                  return;
                }
                else{
                  setState((){
                    url1="";
                    imgname1=pick.name;
                    path=pick.path;
                  });
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.image),
              backgroundColor: Colors.black87
          ),
          if(path!="")FloatingActionButton.extended(
              label: Text("delete"),
              onPressed:(){
                if(imgurldel!=""){
                  FirebaseStorage.instance.refFromURL(imgurldel).delete();
                }
                setState((){
                  url1="";
                  path="";
                });
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete),
              backgroundColor: Colors.black87
          ),
         if(path!="")SizedBox(width: 69.0,),
          if(path!="")FloatingActionButton.extended(
              label: Text("Replace"),
              onPressed: ()async{
                final pick= await ImagePicker().pickImage(source:ImageSource.gallery);
                if(pick==null){
                  Navigator.pop(context);
                  return;
                }
                else{
                  if(imgurldel!=""){
                    FirebaseStorage.instance.refFromURL(imgurldel).delete();
                  }
                  setState((){
                    url1="";
                    imgname1=pick.name;
                    path=pick.path;
                  });
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.image_outlined),
              backgroundColor: Colors.black87
          ),


        ],
      ),
    );
  }

}
