import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 7),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

class FeaturedTile extends StatelessWidget {
  final String name;
  final String price;
  final String imgurl;
  const FeaturedTile({super.key, required this.name, required this.price, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withAlpha(18), offset: Offset(0, 0))],
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(
                    imgurl
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          SizedBox(
            height: 66,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '$name\nRs. $price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class PopularTile extends StatelessWidget {
  final String name;
  final String price;
  final String imgurl;
  const PopularTile({super.key, required this.name, required this.price, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withAlpha(18))],
      ),
      child: Row(
        children: [
          Container(
            width: 133,
            height: 133,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(9)),
            image: DecorationImage(
              image: NetworkImage(
                imgurl
              ),
              fit: BoxFit.cover
            )
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Price',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 180, 180),
                    fontSize: 12
                  ),
                ),
                const SizedBox(height: 2,),
                Text(
                  'Rs. $price',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}