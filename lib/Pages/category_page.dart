import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Services/get_data.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
    List<String> catIDs = [];
    List<String> featServIDs = [];


    getCatIDs()async{
      await FirebaseFirestore.instance.collection('Category').get()
        .then((snapshot){
          snapshot.docs.
          forEach(
            (element){
              catIDs.add(element.reference.id);
              print(element.reference.id);
            });
        });
    }



  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: devicePadding.top + 12,),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10,),
          FutureBuilder(
            future: getCatIDs(),
            builder: (context, snapshot) {
              print(snapshot.data);
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: catIDs.length,
                itemBuilder: (context, index) {
                return  GetCatData(catID: catIDs[index],);
              },);
            },
          ),

        ],
      ),
    );
  }
}