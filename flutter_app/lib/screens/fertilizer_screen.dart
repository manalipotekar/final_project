
import 'package:flutter/material.dart';


class FertilizerScreen extends StatefulWidget {
  const FertilizerScreen({Key? key}) : super(key: key);

  @override
  _FertilizerScreenState createState() => _FertilizerScreenState();
}




class _FertilizerScreenState extends State<FertilizerScreen> {
  TextEditingController n = TextEditingController();
  TextEditingController p = TextEditingController();
  TextEditingController k = TextEditingController();
  TextEditingController crop = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController humidity = TextEditingController();
  TextEditingController soil = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "Fertilizer Recomendation",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("N :"),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "N",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Text("P :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "P",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Text("K :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "K",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
          
           const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children:[

              Text("Temperature :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "K",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Text("Humidity :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "K",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )

            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Text("Soil :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "K",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Text("Crop :"),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "K",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )

            ],
          ),
          ElevatedButton(onPressed: (){}, child: Text("Predict"))
        ],

      ),
    );
  }
}