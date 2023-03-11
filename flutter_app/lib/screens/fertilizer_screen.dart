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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  "N :",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 250, 232, 208)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                    controller: n,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),

                const Text(
                  "P :",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 250, 232, 208)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                    controller: p,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                const Text(
                  "K :",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 250, 232, 208)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                    controller: k,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Temperature ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        controller: k,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Temperature ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        controller: k,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Temperature ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        controller: k,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Temperature ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 250, 232, 208)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        controller: k,
                        style:const  TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 100),


            Container(
              width: 190,
              height:45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25)
              ),
              child: ElevatedButton(
       style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all( 
                  Radius.circular(20)
              )
            ),
          ),
                
                onPressed: () {}, child: Text("Predict"),
                
                ))
          ],
        ),
      ),
    );
  }
}
