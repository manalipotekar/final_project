
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         
          SliverAppBar(
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
// pinned:true,
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: const FlexibleSpaceBar(
                  stretchModes: [
                StretchMode.blurBackground
              ],
              
              background: Image(
              image: AssetImage('assets/cashew.jpg')
            
            )),
            // collapsedHeight: -100,
          ),
         
      const SliverAppBar(
            backgroundColor:Colors.amber ,

            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
          
              background: Image(
              // fit: BoxFit.cover,
              image: AssetImage('assets/cashew.jpg')
            
            )),
          ),      const SliverAppBar(
            backgroundColor:Colors.amber ,

            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(background: Image(
              image: AssetImage('assets/cashew.jpg')
            
            )),
          ),
           const SliverAppBar(
            backgroundColor:Colors.amber ,

            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
          
              background: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/cashew.jpg')
            
            )),
          ),      const SliverAppBar(
            backgroundColor:Colors.amber ,

            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(background: Image(
              image: AssetImage('assets/cashew.jpg')
            
            )),
          ),
        ],
      ),
    );
  }
}