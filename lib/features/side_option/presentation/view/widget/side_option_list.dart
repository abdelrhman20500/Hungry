
import 'package:flutter/material.dart';
import 'package:hungry/features/side_option/data/model/ide_option_model.dart';
import 'package:hungry/features/side_option/presentation/view/widget/side_option_item.dart';

class SideOptionList extends StatelessWidget {
  const SideOptionList({super.key, required this.model });

  final SideOptionModel model;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.21,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.data!.length,
          itemBuilder: (context, index) {
            return SideOptionItem(
              image: model.data![index].image!,
              title: model.data![index].name!,
            );
          }

      ),
    );
  }
}
