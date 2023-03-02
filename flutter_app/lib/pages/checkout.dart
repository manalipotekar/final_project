import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/components/list_card.dart';
import 'package:flutter_app/utils/custom_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final carts = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: carts.length,
              itemBuilder: ((context, index) {
                return ListCard();
              })),
              priceFooter(),
              Container(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child:CustomButton(text: "Checkout", onPress: (){}),),
        ],
      ),
    ));
  }
              priceFooter() {
                return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      height: 2,
                      color: CustomTheme.grey,
                      thickness: 2,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text("Total: ",
                            style: Theme.of(context).textTheme.headlineSmall,                       
                        ),
                        const Spacer(),
                        Text("\$price",
                            style: Theme.of(context).textTheme.headlineSmall,
                        
                        )

                      ],
                    ),)
                  ],
                ),
                );
              }
}
