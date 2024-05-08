import 'package:flutter/material.dart';

class RahtkBackBtn extends StatelessWidget {
  const RahtkBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsetsDirectional.only(start: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child:const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
