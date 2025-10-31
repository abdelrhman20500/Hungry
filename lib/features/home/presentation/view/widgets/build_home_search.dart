import 'package:flutter/material.dart';
import 'build_custom_search.dart';


class BuildHomeSearch extends StatelessWidget {
  const BuildHomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // showSearch(context: context, delegate: SearchScreen());
            },
            child: const AbsorbPointer(
              child: BuildCustomSearch(name: "Search .....",iconData: Icons.search,),
            ),
          ),
        ),
      ],
    );
  }
}

