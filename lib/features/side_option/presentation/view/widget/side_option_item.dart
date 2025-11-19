
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SideOptionItem extends StatelessWidget {
  const SideOptionItem({super.key, required this.image, required this.title,});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
      height: height*0.2,
      width: width*0.4,
      decoration: BoxDecoration(
          color: const Color(0xff3C2F2F),
          borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0)
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              width: width*0.4,
              height: height * 0.14,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[500]!,
                child: Container(
                  height: height * 0.14,
                  width: 120,
                  color: Colors.grey,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(height: height*0.02),
          Text(title, style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white
          ),),
        ],
      ),
    );
  }
}
