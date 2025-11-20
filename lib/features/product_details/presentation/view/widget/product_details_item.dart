import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key, required this.image,
    required this.title, required this.description,
    required this.price, required this.rating});

  final String image;
  final String title;
  final String description;
  final String price;
  final String rating;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          height: height * 0.3, // Adjust height
          width: double.infinity, // Full width
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            child: Container(
              height: height * 0.4,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
        SizedBox(height: height*0.02,),
        Text(title,maxLines:1,overflow: TextOverflow.ellipsis, style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black,),),
        SizedBox(height: height*0.01,),
        Text(description,
          maxLines:3,overflow: TextOverflow.ellipsis,style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey,),),
        SizedBox(height: height*0.01,),
        Row(
          children: [
            Text("\$ $price",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.star, size: 24,color: Colors.orange,),
            Text("($rating)", style: const TextStyle(fontSize: 22),),
          ],
        )
      ],
    );
  }
}
