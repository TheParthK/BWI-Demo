


import 'package:bwi_demo2/Services/get_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    // getDataFromFB();
    super.initState();
  }

    List<String> featServIDs = [];
    getFeatServIDs()async{
      await FirebaseFirestore.instance.collection('Featured_Services').get()
        .then((snapshot){
          snapshot.docs.
          forEach(
            (element){
              print(element);
              featServIDs.add(element.reference.id);
              print(featServIDs.first);
            });
        });
  }
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(height: devicePadding.top + 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    image: DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/736x/c9/0e/df/c90edf272c4519eea485aaa9f0605c10.jpg'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                const SizedBox(width: 10,),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  splashColor: Colors.black38,
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: Ink(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(30),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1607008829749-c0f284a49fc4?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                fit: BoxFit.cover
              )
            ),

          ),

          const CustomTitle(title: 'Featured Services'),
          SizedBox(
            height: 220,
            child: FutureBuilder(
            future: getFeatServIDs(),
            builder: (context, snapshot) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: featServIDs.length,
                itemBuilder: (context, index) {
                return  GetFeatServData(servID: featServIDs[index]);
              },);
            },
          ),
          ),
          const CustomTitle(title: 'Popular Services'),
          // const PopularTile(),
          // const PopularTile(),
          // const PopularTile(),
          FutureBuilder(
            future: getFeatServIDs(),
            builder: (context, snapshot) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: featServIDs.length,
                itemBuilder: (context, index) {
                return  GetPopServData(servID: featServIDs[featServIDs.length-index-1]);
              },);
            },
          ),

          SizedBox(height: devicePadding.bottom + 50,)
        ],
      ),
    );
  }
}

class ServicesWidgetModal{
  final String title;
  final String price;
  final String imgURL;
  const ServicesWidgetModal({required this.title, required this.price, required this.imgURL});
}