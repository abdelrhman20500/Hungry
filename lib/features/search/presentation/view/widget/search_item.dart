import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hungry/features/product_details/presentation/view/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.id, required this.image, required this.title, required this.description, required this.price, required this.rating});
  final int id;
  final String image;
  final String title;
  final String description;
  final String price;
  final String rating;


  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        ProductDetailsScreen(id: id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 5, // Softness of the shadow
              offset: const Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.fill,
                        height: height * 0.17, // Adjust height
                        width: double.infinity, // Full width
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[500]!,
                          child: Container(
                            height: height * 0.2,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),),
                  Positioned(
                      top: 4.0,
                      right: 4.0,
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.8),
                          radius: 24,
                          child: IconButton(onPressed: (){},
                              icon: const Icon(Icons.favorite_border, color: Colors.blue,size: 28,))))
                ],
              ),
              SizedBox(height: height*0.01,),
              Text(title,maxLines:1,overflow: TextOverflow.ellipsis, style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black,),),
              SizedBox(height: height*0.01,),
              Text(description,
                maxLines:3,overflow: TextOverflow.ellipsis,style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey,),),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  Text("\$$price",
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
          ),
        ),
      ),
    );
  }
}

