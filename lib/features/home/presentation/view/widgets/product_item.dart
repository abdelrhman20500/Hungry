import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
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
            Center(
              child: Image.asset("assets/images/image 6.png",
                height: height*0.2, fit: BoxFit.fill,),),
            SizedBox(height: height*0.01,),
            const Text("Hungry?", style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),),
            SizedBox(height: height*0.01,),
            const Text("Hungry? Hungry? Hungry? Hungry? Hungry?",
              maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey,),),
            SizedBox(height: height*0.01,),
            Row(
              children: [
                const Icon(Icons.star, size: 28,color: Colors.yellow,),
                SizedBox(width: width*0.03,),
                const Text("(3.4)", style: TextStyle(fontSize: 24),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
