import 'package:flutter/material.dart';

class AddOpinionPage extends StatelessWidget {
  const AddOpinionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ekran drugi'),
      ),
      body: Center(child: Text('Ekran drugi')),
    );
  }
}
