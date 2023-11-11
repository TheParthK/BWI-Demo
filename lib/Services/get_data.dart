import 'package:bwi_demo2/Widgets/category_widgets.dart';
import 'package:bwi_demo2/Widgets/home_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetCatData extends StatelessWidget {
  final String catID;
  const GetCatData({super.key, required this.catID});

  @override
  Widget build(BuildContext context) {
    CollectionReference categories = FirebaseFirestore.instance.collection('Category');

    return FutureBuilder(
      future: categories.doc(catID).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
        print('name : ${data['name']}');
        // return Text(data['name']);
        return CategoryTile(name: data['name'].toString(), imgURL: data['imgurl']);

      }
      return CupertinoActivityIndicator();
    },);
  }
}
class GetFeatServData extends StatelessWidget {
  final String servID;
  const GetFeatServData({super.key, required this.servID});

  @override
  Widget build(BuildContext context) {
    CollectionReference categories = FirebaseFirestore.instance.collection('Featured_Services');

    return FutureBuilder(
      future: categories.doc(servID).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
        print('name : ${data['name']}');
        // return Text(data['name']);
        return FeaturedTile(imgurl: data['imgurl'].toString(), name: data['name'].toString(), price: data['price'].toString());

      }
      return const SizedBox();
    },);
  }
}
class GetPopServData extends StatelessWidget {
  final String servID;
  const GetPopServData({super.key, required this.servID});

  @override
  Widget build(BuildContext context) {
    CollectionReference categories = FirebaseFirestore.instance.collection('Featured_Services');

    return FutureBuilder(
      future: categories.doc(servID).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
        print('name : ${data['name']}');
        // return Text(data['name']);
        return PopularTile(imgurl: data['imgurl'].toString(), name: data['name'].toString(), price: data['price'].toString());

      }
      return const SizedBox();
    },);
  }
}