import 'package:flutter/material.dart';
import 'package:hungry/features/home/presentation/view/widgets/build_home_search.dart';
import 'package:hungry/features/home/presentation/view/widgets/product_bloc_builder.dart';
import 'package:hungry/features/home/presentation/view/widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hungry?", style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold,color: Color(0xff08431D),
                      ),
                    ),
                    Text("Hello, Rich Sonic", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.person_pin, size: 52, color: Colors.grey)
              ],
            ),
            SizedBox(height: height * 0.02),
            const BuildHomeSearch(),
            SizedBox(height: height * 0.02),
            ProductBlocBuilder(),
          ],
        ),
      ),
    );
  }
}