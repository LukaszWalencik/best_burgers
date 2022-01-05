import 'package:flutter/material.dart';

class AddOpinionPage extends StatefulWidget {
  const AddOpinionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPage> createState() => _AddOpinionPageState();
}

class _AddOpinionPageState extends State<AddOpinionPage> {
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
