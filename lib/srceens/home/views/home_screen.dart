
import 'dart:math';

import 'package:expense_manage_app/srceens/add_expense/views/add_expense.dart';
import 'package:expense_manage_app/srceens/home/views/main_screen.dart';
import 'package:expense_manage_app/srceens/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int index = 0;

 late Color selectedItem = Colors.blue ;
 Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius:const  BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value){
           setState(() {
             index = value;
           });
          },
        //   fixedColor: Colors.red,
        // backgroundColor: Colors.,
          backgroundColor: const Color(0xFFCCFFFF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(

                icon: Icon(
                    CupertinoIcons.home,
                  color :index == 0 ? selectedItem : unselectedItem,
                ),label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                    CupertinoIcons.graph_square_fill,
                  color :index == 1 ? selectedItem : unselectedItem,
                ), label: "Stats")
          ],

      ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) => const AddExpense())
          );
      },
        shape:const  CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF99FFFF),
          ),
          child: const Icon(CupertinoIcons.add,
          ),

        ),

      ) ,

      body:index == 0 ? const MainScreen() : const StatsScreen()

    );
  }
}
