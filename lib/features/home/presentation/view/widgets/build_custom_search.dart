import 'package:flutter/material.dart';

class BuildCustomSearch extends StatelessWidget {
  const BuildCustomSearch({super.key, required this.name, required this.iconData,this.controller, this.onSubmitted});
  final String name;
  final IconData iconData;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        labelText: name,
        prefixIcon:  Icon(iconData),
      ),
    );
  }
}
