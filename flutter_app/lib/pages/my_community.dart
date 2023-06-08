import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/add_post.dart';
import 'package:flutter_app/screens/post_display.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyCommunityScreen extends StatefulWidget {
  const MyCommunityScreen({Key? key}) : super(key: key);

  @override
  _MyCommunityScreenState createState() => _MyCommunityScreenState();
}

class _MyCommunityScreenState extends State<MyCommunityScreen> {
  late List<String> likedPostIds;
  late Stream<QuerySnapshot<Map<String, dynamic>>> firestoreDB;

  @override
  void initState() {
    super.initState();
    firestoreDB = FirebaseFirestore.instance.collection("productlist").snapshots();
    likedPostIds = [];
    fetchLikedPostIds();
  }

  void fetchLikedPostIds() async {
    String userId = 'CdPXOk3GAnNZAkJ03O2YsWPVotK2'; // Replace with your actual user ID
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (snapshot.exists) {
      setState(() {
        likedPostIds = List<String>.from((snapshot.data() as Map<String, dynamic>)['liked_posts'] ?? []);
      });
    }
  }

  Future<void> likePost(String postId) async {
    String userId = 'CdPXOk3GAnNZAkJ03O2YsWPVotK2'; // Replace with your actual user ID

    if (!likedPostIds.contains(postId)) {
      await FirebaseFirestore.instance.collection('productlist').doc(postId).update({'likes': FieldValue.increment(1)});
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'liked_posts': FieldValue.arrayUnion([postId])
      });
      setState(() {
        likedPostIds.add(postId);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have already liked this post.'),
        ),
      );
    }
  }

  bool isPostLiked(String postId) {
    return likedPostIds.contains(postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPostScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                var documentData = data.docs[index].data();
                var postId = data.docs[index].id;
                var likes = documentData['likes'];
                var isLiked = isPostLiked(postId);

                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(5),
                  height: 371,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 190,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PostDisplay()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            child: CachedNetworkImage(
                              height: 90,
                              imageUrl: documentData['product_image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        documentData['title'],
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 60,
                        child: Text(
                          documentData['description'],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      isLiked ? Colors.green : Colors.white,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      isLiked ? Colors.white : Colors.green,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.green),
      ),
    ),
  ),
  onPressed: () {
    likePost(postId);
  },
  child: Icon(Icons.thumb_up),
),
                          
                          // ElevatedButton( 
                          //   style: ButtonStyle(
                              
                          //     backgroundColor: MaterialStateProperty.all<Color>(
                          //       isLiked ? Colors.green : Colors.white,
                          //     ),
                          //     foregroundColor: MaterialStateProperty.all<Color>(
                          //       isLiked ? Colors.white : Colors.green,
                          //     ),
                          //   ),
                          //   onPressed: () {
                          //     likePost(postId);
                          //   },
                          //   child: Icon(Icons.thumb_up),
                          // ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(likes.toString() + " Likes"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
