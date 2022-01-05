import 'package:best_burgers/app/home/bottom_bar_pages/account_page_content.dart';
import 'package:best_burgers/app/home/bottom_bar_pages/add_opinion_page_content.dart';
import 'package:best_burgers/app/home/bottom_bar_pages/opinion_page_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bottomindex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (bottomindex == 0) {
          return const OpinionPage();
        }
        if (bottomindex == 1) {
          return AddOpinionPage(
            onAdd: () {
              setState(() {
                bottomindex = 0;
              });
            },
          );
        }
        return AccountPage(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomindex,
        onTap: (newbottomindex) {
          setState(() {
            bottomindex = newbottomindex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.reviews), label: 'Opinie'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dodaj opinie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Moje konto'),
        ],
      ),
    );
  }
}
