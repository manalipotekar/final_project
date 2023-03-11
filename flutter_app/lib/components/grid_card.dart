import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/utils/custom_theme.dart';

class GridCard extends StatelessWidget {
  final int index;
  final void Function() onPress;
  final Product product;
  // const GridCard({super.key});
  const GridCard(
      {Key? key,
      required this.product,
      required this.index,
      required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0 ? EdgeInsets.all(5) : EdgeInsets.all(5),
      decoration: CustomTheme.getCardDecoration(),
      child: Container(
         decoration:
                  BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
        // elevation: 5,
// borderOnForeground: true,

        child: GestureDetector(
          onTap: onPress,
          child: Container(
             
              decoration:
                  BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 206, 224, 255),),
                    height: 180,
                    // flex: 3,
                    child: SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                        ))),
                Container(
                    // flex: 2,
                    height: 70,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Container(
                      padding: EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              product.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                          Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.green),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ))),
                                onPressed: () {},
                                child: Text(
                                  product.price.toString(),
                                )),
                          )
                        ],
                      ),
                    ))
              ])),
        ),
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