import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selecDate = DateTime.now();
  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          // resizeToAvoidBottomInset: true,
          resizeToAvoidBottomInset: false,

          backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Add Expense",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          controller: expenseController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.dollarSign,
                                size: 16,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: categoryController,
                        textAlignVertical: TextAlignVertical.center,
                        // readOnly: true,
                        onTap: () {},
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              FontAwesomeIcons.list,
                              size: 16,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      bool isExpended = false;
                                      String iconSelected = '';
                                      Color categoryColor = Colors.white;
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return AlertDialog(
                                          title:
                                              const Text('Create a Category'),
                                          content: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  // readOnly: true,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      hintText: ('Name'),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            BorderSide.none,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                TextFormField(
                                                  onTap: () {
                                                    setState(() {
                                                      isExpended = !isExpended;
                                                    });
                                                  },
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  // readOnly: true,
                                                  decoration:
                                                      const InputDecoration(
                                                          isDense: true,
                                                          filled: true,
                                                          suffixIcon: Icon(
                                                            CupertinoIcons
                                                                .chevron_down,
                                                            size: 9,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          hintText: ('Icon'),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            12)),
                                                            borderSide:
                                                                BorderSide.none,
                                                          )),
                                                ),
                                                isExpended
                                                    ? Expanded(
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 200,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    bottom: Radius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                          child: GridView.builder(
                                                            // shrinkWrap: true,
                                                            //   physics: const NeverScrollableScrollPhysics(),
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount: 3,
                                                                mainAxisSpacing:
                                                                    5,
                                                                crossAxisSpacing:
                                                                    5,
                                                              ),
                                                              itemCount:
                                                                  myCategoriesIcons
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      int i) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      iconSelected =
                                                                          myCategoriesIcons[
                                                                              i];
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: iconSelected == myCategoriesIcons[i]
                                                                                ? Colors
                                                                                    .green
                                                                                : Colors
                                                                                    .grey),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/${myCategoriesIcons[i]}.png'))),
                                                                  ),
                                                                );
                                                              }),
                                                        ),
                                                    )
                                                    : Container(),
                                                // child: Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: ListView.builder(
                                                //       itemCount: state.categories.length,
                                                //       itemBuilder: (context, int i) {
                                                //         return Card(
                                                //           child: ListTile(
                                                //             onTap: () {
                                                //               setState(() {
                                                //                 expense.category = state.categories[i];
                                                //                 categoryController.text = expense.category.name;
                                                //               });
                                                //             },
                                                //             leading: Image.asset(
                                                //               'assets/${state.categories[i].icon}.png',
                                                //               scale: 2,
                                                //             ),
                                                //             title: Text(state.categories[i].name),
                                                //             tileColor: Color(state.categories[i].color),
                                                //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                //           ),
                                                //         );
                                                //       }
                                                //   )
                                                // )
                                                  const SizedBox(
                                                  height: 16,
                                                ),
                                                TextFormField(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (ctx2) {
                                                          return AlertDialog(
                                                              content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              ColorPicker(
                                                                pickerColor:
                                                                    Colors.blue,
                                                                onColorChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    categoryColor =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                              SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                height: 50,
                                                                child:
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                              final expenseData = {
                                                                                'expense': expenseController.text,
                                                                                'category': categoryController.text,
                                                                                'date': dateController.text,
                                                                              };
                                                                              Navigator.pop(context, expenseData);
                                                                              print(expenseData);
                                                                        },
                                                                        style: TextButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.black,
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                                                        child: const Text(
                                                                          'Save',
                                                                          style: TextStyle(
                                                                              fontSize: 22,
                                                                              color: Colors.white),
                                                                        )),
                                                              )
                                                            ],
                                                          ));
                                                        });
                                                  },
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  // readOnly: true,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: categoryColor,
                                                      hintText: ('Color'),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            BorderSide.none,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: kToolbarHeight,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.black,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12))),
                                                      child: const Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: ('Category'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            )),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: dateController,
                        textAlignVertical: TextAlignVertical.center,
                        // readOnly: true,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: selecDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 365)));
                          if (newDate != null) {
                            dateController.text =
                                DateFormat('dd/MM/yyyy').format(newDate);
                            selecDate = newDate;
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              FontAwesomeIcons.clock,
                              size: 16,
                              color: Colors.grey,
                            ),
                            hintText: ('Date'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            )),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: kToolbarHeight,
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: const Text(
                              'Save',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
