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
        title: Text('Ekran pierwszy'),
      ),
      body: Center(
        child: Text('Ekran pierwszy'),
      ),
    );
  }
}
