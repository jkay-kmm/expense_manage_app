import 'dart:js';

import 'package:expense_manage_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle, color: Colors.yellow[700]),
                        ),
                        Icon(CupertinoIcons.person_fill,
                        color: Theme.of(context).colorScheme.outline,)
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome! ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                        Text("Chao Anh Trung",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground),)
                      ],
                    ),

                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.settings))
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [

                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),

                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade400,
                    offset:const  Offset(5,5)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Total Balance", style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  const SizedBox(height: 12,),
                  const Text("\$48.000",style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                                height: 25,
                              decoration:const  BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle
                              ),
                              child: const Center(
                                child: Icon(CupertinoIcons.arrow_down,
                                size: 12,
                                color: Colors.greenAccent,),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Income',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text('\$20.000',
                                    style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),)
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration:const  BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle
                              ),
                              child: const Center(
                                child: Icon(CupertinoIcons.arrow_down,
                                  size: 12,
                                  color: Colors.red,),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expenses',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text('\$50.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transactions',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold
                    )
                ),
                GestureDetector(

                  onTap: (){

                  },
                  child: Text('View All',
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.w400
                      )
                  ),
                ),

              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: transactionData.length,
                  itemBuilder: (context, int i){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration:  BoxDecoration(
                                      color: transactionData[i]['color'],
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                  transactionData[i]['icon'],
                                  // const SizedBox(width: 12,),
                                  // const Icon(Icons.food_bank,
                                  // color: Colors.white,)
                                ],
                              ),
                              const SizedBox(width: 12,),
                              Text(transactionData[i]['name'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).colorScheme.onBackground,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(transactionData[i]['totalAmount'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).colorScheme.onBackground,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                              Text(transactionData[i]['date'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).colorScheme.outline,
                                      fontWeight: FontWeight.w500
                                  )
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              ),
            )
          ],
        ),
      ),
    );
  }
}
