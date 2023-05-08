import 'package:flutter/material.dart';

import 'nearbyShopsDetails.dart';

Color green = const Color.fromRGBO(8, 129, 58, 1);

class NearbyShops extends StatefulWidget {
  const NearbyShops({super.key});

  @override
  State<NearbyShops> createState() => _NearbyShopsState();
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class _NearbyShopsState extends State<NearbyShops> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.account_circle,
                size: 40,
              ),
            )
          ],
          backgroundColor: green,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Positioned(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 14, 0, 10),
                            hintText: 'Search',
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 45,
                    ),
                    Icon(Icons.location_on_outlined),
                    Text(
                      "Home- Divar Island, Old Goa Ferry",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Divider(),
                ListOfNearbyShops(
                  title: "The Seed Store",
                  items: "Seeds, Fertilizers",
                  location: "Panaji Goa",
                  cardColor: Colors.grey.shade100,
                  pic: 'assets/farmshop.png',
                ),
                ListOfNearbyShops(
                  title: "Ashish Agro Store",
                  items: "Seeds, Farming tools",
                  location: "Panaji Goa",
                  cardColor: Colors.yellow.shade100,
                  pic: 'assets/farmshop.png',
                ),
                ListOfNearbyShops(
                  title: "Farm Products",
                  items: "Seeds, Bio Stimulators",
                  location: "Panaji Goa",
                  cardColor: Colors.blue.shade100,
                  pic: 'assets/farmshop.png',
                ),
                ListOfNearbyShops(
                  title: "The Seed Store",
                  items: "Fertilizers",
                  location: "Panaji Goa",
                  cardColor: Colors.green.shade100,
                  pic: 'assets/farmshop.png',
                ),
                ListOfNearbyShops(
                  title: "The Seed Store",
                  items: "Fertilizers",
                  location: "Panaji Goa",
                  cardColor: Colors.green.shade100,
                  pic: 'assets/farmshop.png',
                ),
              ],
            ),
          ),
        ));
  }
}

class ListOfNearbyShops extends StatelessWidget {
  const ListOfNearbyShops(
      {Key? key,
      required this.items,
      required this.location,
      required this.title,
      required this.cardColor,
      required this.pic})
      : super(key: key);

  final String title;
  final String items;
  final String location;
  final Color cardColor;
  final String pic;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Container(
                height: 120,
                width: 120,
                child: Image.asset(
                  pic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      items,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey.shade600),
                    Text(
                      location,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/NearByShopDetails');
                      },
                      child: const Text(
                        "View Contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
