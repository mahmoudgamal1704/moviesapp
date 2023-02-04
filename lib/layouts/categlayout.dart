import 'package:flutter/material.dart';

import '../models/CategResponse.dart';

class CategLayout extends StatelessWidget {
  // const CategLayout({Key? key}) : super(key: key);
   Genres categ ;

   CategLayout(this.categ);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/${categ.name}.png',fit: BoxFit.cover,),
              Text('${categ.name}',style: TextStyle(fontSize: 25,color: Colors.black),)
            ],
          ),
    );
  }
}
