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
            children: [
              Image.asset('assets/images/${categ.name}.png'),
              Text('${categ.name}')
            ],
          ),
    );
  }
}
