import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart-state.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key, required this.image,
    required this.title, required this.description,required this.id,
    required this.price, required this.rating});

  final int id;
  final String image;
  final String title;
  final String description;
  final String price;
  final String rating;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
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
        SizedBox(height: height*0.02,),
        Row(
          children: [
            Text("\$ $price",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: width*0.03,),
            const Icon(Icons.star, size: 24,color: Colors.orange,),
            Text("($rating)", style: const TextStyle(fontSize: 22),),
            const Spacer(),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is AddCartLoading) {
                  // حالة التحميل
                  return Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff08431D),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else if (state is AddCartSuccess) {
                  // حالة النجاح
                  return Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: Text(
                        "Added ✔",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else if (state is AddCartFailure) {
                  // حالة الفشل
                  return Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: Text(
                        "Failed ❌",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  // الحالة العادية
                  return Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff08431D),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).addCart(id);
                        },
                        child: const Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        )
      ],
    );
  }
}
