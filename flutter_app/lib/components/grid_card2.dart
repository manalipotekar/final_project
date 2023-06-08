import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/utils/custom_theme.dart';

class GridCard2 extends StatelessWidget {
  final int index;
  final void Function() onPress;
  final Product product;
  // const GridCard({super.key});
  const GridCard2({Key? key,required this.product, required this.index, required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: index % 2 == 0 ? EdgeInsets.all(12) : EdgeInsets.all(12),
      decoration: CustomTheme.getCardDecoration() ,
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Column(children: [
              Expanded(
                  flex: 7,
                  child: SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(imageUrl: product.image,)
                  )),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            product.title,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                        )
                      ],
                    ),
                  ))
            ])),
      ),
    );
  }
}




/*
 return Container(
      
      margin:EdgeInsets.all(12)  ,
      decoration: CustomTheme.getCardDecoration() ,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          // height: 600,
            // borderRadius: BorderRadius.circular(15),
            child: Column(children: [
              Expanded(
                  // flex: 8,
                  child: SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(imageUrl: product.image,)
                  )),
              Expanded(
                  // flex: 2,
                  child: Center(
                    child: Column(
                      
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1),
                          child: Text(
                            product.title,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                        ),
                       

                      ],
                    ),
                  )),
                  Text("data")
            ])),
      ),
    );

    */