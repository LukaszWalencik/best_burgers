import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpinionPage extends StatelessWidget {
  const OpinionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ekran pierwszy'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('places')
              .orderBy('rating', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            final documents = snapshot.data!.docs;
            return ListView(children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(document['name']),
                          Text(document['foodname']),
                        ],
                      ),
                      Text(document['rating'].toString()),
                    ],
                  ),
                )
              ]
            ]);
          }),
    );
  }
}
