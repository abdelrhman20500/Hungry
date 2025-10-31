import 'package:flutter/material.dart';

import 'build_category_item.dart';

class BuildCategoryList extends StatelessWidget {
  const BuildCategoryList({
    super.key,});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.1,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: BuildCategoryItem(),
            );
          }
      ),
    );
  }
}
