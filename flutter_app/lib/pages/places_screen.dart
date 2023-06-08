import 'package:flutter/material.dart';
import 'package:flutter_app/pages/single_city.dart';


class Places_Screen extends StatelessWidget {
  const Places_Screen({super.key});

  final List<Map<String, dynamic>> clityList = const [
    {
      "address": "Jaipur the pink city",
      "id": "jaipur_01",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",
      "lat":15.254746476771285,
      "lng": 73.96006318465938,
      "name": "Jaipur India",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "New Delhi capital of india",
      "id": "delhi_02",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",

      "lat":15.254746476771285,
      "lng":74.96006318465938,
      "name": "Delhi City India",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Mumbai City",
      "id": "mumbai_03",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",
 
      "lat": 15.254746476771285,
      "lng": 73.96006318465938,
      "name": "Mumbai City India",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Udaipur City",
      "id": "udaipur_04",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoWCVxwek64-fnkk0cUtZri4NwVGB1p17GkMc8Gthx&s",

      "lat": 24.571270,
      "lng": 73.691544,
      "name": "Udaipur City India",
      "phone": "7014333352",
      "region": "South Asia"
    }
  ];

    getDetails(Map singleCityData, BuildContext context) {
    print(singleCityData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleCity(
          cityData: singleCityData,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("City List of India"),
      ),
      body: ListView.builder(
        itemCount: clityList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                // CachedNetworkImage(imageUrl: clityList[index]['image'], 
                //   fit: BoxFit.cover,
                //   width: MediaQuery.of(context).size.width,
                //   height: 200,

                // ),
                // Image.network(
                //   clityList[index]['image'],
                //   height: 200,
                //   fit: BoxFit.cover,
                //   width: MediaQuery.of(context).size.width,
                // ),
                const Text("data"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        clityList[index]['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getDetails(clityList[index], context);
                      },
                      child: const Text("View Details"),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  
  }
}