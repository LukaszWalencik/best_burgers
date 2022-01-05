import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPage extends StatefulWidget {
  const AddOpinionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPage> createState() => _AddOpinionPageState();
}

class _AddOpinionPageState extends State<AddOpinionPage> {
  var placeName = '';
  var foodName = '';
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ekran drugi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Nazwa restauracji'),
                onChanged: (newplaceName) {
                  setState(() {
                    placeName = newplaceName;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (newfoodName) {
                  setState(() {
                    foodName = newfoodName;
                  });
                },
                decoration: InputDecoration(hintText: 'Nazwa dania'),
              ),
              SizedBox(height: 10),
              Slider(
                  value: rating,
                  min: 1.0,
                  max: 6.0,
                  divisions: 5,
                  label: rating.toString(),
                  onChanged: (newrating) {
                    setState(() {
                      rating = newrating;
                    });
                  }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('places').add(
                    {'name': placeName, 'foodname': foodName, 'rating': rating},
                  );
                },
                child: Text('Dodaj opinie'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
