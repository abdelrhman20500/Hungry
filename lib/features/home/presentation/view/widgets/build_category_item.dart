import 'package:flutter/material.dart';

class BuildCategoryItem extends StatelessWidget {
  const BuildCategoryItem({
    super.key,});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
      height: height*0.05,
      width: width*0.3,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: const Center(child: Text("data",style: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w600,
      ),),),
    );
  }
}
