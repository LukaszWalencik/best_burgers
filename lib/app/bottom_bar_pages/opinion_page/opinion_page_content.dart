import 'package:best_burgers/app/bottom_bar_pages/opinion_page/cubit/opinion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocProvider(
        create: (context) => OpinionCubit()..startapp(),
        child: BlocBuilder<OpinionCubit, OpinionState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Text('Something went wrong: ${state.errorMessage}');
            }

            if (state.isLoading == true) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              ));
            }
            final documents = state.documents;
            return ListView(
              children: [
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
              ],
            );
          },
        ),
      ),
    );
  }
}
