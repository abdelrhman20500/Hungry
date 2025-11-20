import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.itemId,
  });

  final String image;
  final String title;
  final int itemId;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                height: height * 0.15, // Adjust height
                width: width*0.3, // Full width
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    height: height * 0.2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 12.0,
              ),
               SizedBox(
                width: 150,
                child: Text(title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff08431D),
                      border: Border.all(
                        color: const Color(0xff08431D),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "1",
                    style: TextStyle(
                        color: Color(0xff08431D),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff08431D),
                      border: Border.all(
                        color: const Color(0xff08431D),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    color: const Color(0xff08431D),
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).deleteCart(itemId);
                  },
                  child: const Text(
                    "Remove",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
