import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final String imgURL;
  const CategoryTile({super.key, required this.name, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(imgURL),
                  fit: BoxFit.contain
                )
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            )
        ],
      ),
    );
  }
}