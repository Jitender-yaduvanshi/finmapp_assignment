import 'dart:convert';
import 'dart:developer';
import 'package:fin_mapp_project/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';

class AboutLoan extends StatefulWidget {
  const AboutLoan({
    super.key,
  });

  @override
  State<AboutLoan> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AboutLoan>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int currentIndex = 0;
  int? selectedLoan;
  int? selectedWork;
  int? selectedExistingLoan;
  int? selectedState;
  int? selectedCity;
  TextEditingController incomeController = TextEditingController();

  Future<List> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/Questions.json');
    final mapData = json.decode(jsondata) as Map<String, dynamic>;

    final list = mapData['schema']['data'] as List<dynamic>;

    return list;
  }

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: 0,
    );
  }

  bool isLoading = false;
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  const Text(
                    'About loan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Positioned(
                    top: height * 0.12,
                    left: width * 0.38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                              _controller.jumpToPage(0);
                            });
                          },
                          child: Container(
                            width: width * 0.15,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: (currentIndex == 0)
                                  ? Colors.lightGreen
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = 1;
                              _controller.jumpToPage(1);
                            });
                          },
                          child: Container(
                            width: width * 0.15,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: (currentIndex == 1)
                                  ? Colors.lightGreen
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = 2;
                              _controller.jumpToPage(2);
                            });
                          },
                          child: Container(
                            width: width * 0.15,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: (currentIndex == 2)
                                  ? Colors.lightGreen
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = 3;
                              _controller.jumpToPage(3);
                            });
                          },
                          child: Container(
                            width: width * 0.18,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: (currentIndex == 3)
                                  ? Colors.lightGreen
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = 4;
                              _controller.jumpToPage(4);
                            });
                          },
                          child: Container(
                            width: width * 0.15,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: (currentIndex == 4)
                                  ? Colors.lightGreen
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: height * 0.721,
                      child: FutureBuilder<List<dynamic>>(
                          future: ReadJsonData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Text('No data available');
                            } else {
                              // Data available
                              return PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _controller,
                                onPageChanged: (value) {
                                  setState(() {
                                    // selectedAnswers.add(snapshot.data![currentIndex]
                                    //         ['page']['options'][selectedLayer]
                                    //     ['value']);
                                    // log('hello:${selectedAnswers}');
                                    currentIndex = value;
                                  });
                                },
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var res = snapshot.data![currentIndex];
                                  log('dd2dd:${snapshot.data!.length}');
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3.0, right: 3.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Text(
                                          res['page']['label'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        (currentIndex == 0 ||
                                                currentIndex == 1 ||
                                                currentIndex == 3)
                                            ? Column(
                                                children: List.generate(
                                                res['page']['options'].length,
                                                ((index) => Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          height:
                                                              height * 0.045,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 8,
                                                                  bottom: 8),
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 2,
                                                                  left: 5,
                                                                  right: 2),
                                                          child: ListTile(
                                                            title: Text(
                                                              res['page'][
                                                                      'options']
                                                                  [
                                                                  index]['value'],
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                            leading: Radio(
                                                              value: index,
                                                              groupValue: (currentIndex ==
                                                                      0)
                                                                  ? selectedLoan
                                                                  : (currentIndex ==
                                                                          1)
                                                                      ? selectedWork
                                                                      : selectedExistingLoan,
                                                              activeColor: Colors
                                                                  .orangeAccent,
                                                              visualDensity:
                                                                  const VisualDensity(
                                                                      horizontal:
                                                                          -4),
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  (currentIndex ==
                                                                          0)
                                                                      ? selectedLoan =
                                                                          value!
                                                                      : (currentIndex ==
                                                                              1)
                                                                          ? selectedWork =
                                                                              value!
                                                                          : selectedExistingLoan =
                                                                              value!;
                                                                });
                                                              },
                                                            ),
                                                            minVerticalPadding:
                                                                5,
                                                            horizontalTitleGap:
                                                                2,
                                                            visualDensity:
                                                                const VisualDensity(
                                                                    vertical:
                                                                        -4),
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ))
                                            : (currentIndex == 2)
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 12.0),
                                                        child: Text(
                                                          '- ${res['page']['family_field'][0]['select']['label']}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5)),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        height: height * 0.045,
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 8, bottom: 8),
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 2,
                                                                left: 5,
                                                                right: 2),
                                                        child: TextField(
                                                          controller:
                                                              incomeController,
                                                          keyboardType:
                                                              const TextInputType
                                                                  .numberWithOptions(
                                                                  decimal:
                                                                      true),
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    r'^\d+\.?\d{0,2}')),
                                                          ],
                                                          decoration:
                                                              const InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10.0),
                                                            hintText:
                                                                'Enter total income',
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 155.0),
                                                        child: Text(
                                                          '* ${res['page']['family_field'][1]['select']['label']}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 12.0),
                                                        child: Text(
                                                          '- ${res['page']['income_field'][0]['log']['label']}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: List.generate(
                                                          3,
                                                          ((index) => Column(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              5)),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    height:
                                                                        height *
                                                                            0.045,
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 2,
                                                                        left: 5,
                                                                        right:
                                                                            2),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        res['page']['income_field'][0]['log']['options'][index]
                                                                            [
                                                                            'value'],
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                      ),
                                                                      leading:
                                                                          Radio(
                                                                        value:
                                                                            index,
                                                                        groupValue:
                                                                            selectedState,
                                                                        activeColor:
                                                                            Colors.orangeAccent,
                                                                        visualDensity:
                                                                            const VisualDensity(horizontal: -4),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            selectedState =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      minVerticalPadding:
                                                                          5,
                                                                      horizontalTitleGap:
                                                                          2,
                                                                      visualDensity:
                                                                          const VisualDensity(
                                                                              vertical: -4),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      dense:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 12.0),
                                                        child: Text(
                                                          '- ${res['page']['income_field'][1]['log']['label']}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: List.generate(
                                                          3,
                                                          ((index) => Column(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              5)),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    height:
                                                                        height *
                                                                            0.045,
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 2,
                                                                        left: 5,
                                                                        right:
                                                                            2),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        res['page']['income_field'][1]['log']['options'][index]
                                                                            [
                                                                            'value'],
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                      ),
                                                                      leading:
                                                                          Radio(
                                                                        value:
                                                                            index,
                                                                        groupValue:
                                                                            selectedCity,
                                                                        activeColor:
                                                                            Colors.orangeAccent,
                                                                        visualDensity:
                                                                            const VisualDensity(horizontal: -4),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            selectedCity =
                                                                                value!;
                                                                            // selectedAnswers.add(res['page']['options'][value]['value']);
                                                                            // log('hello:${selectedAnswers}');
                                                                          });
                                                                        },
                                                                      ),
                                                                      minVerticalPadding:
                                                                          5,
                                                                      horizontalTitleGap:
                                                                          2,
                                                                      visualDensity:
                                                                          const VisualDensity(
                                                                              vertical: -4),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      dense:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (currentIndex > 0) {
                                currentIndex--;
                              }
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            });
                            ReadJsonData();
                          },
                          child: const Row(children: [
                            Icon(size: 20, Icons.arrow_back_ios_sharp),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ]),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.orange,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (currentIndex < 4) {
                                      currentIndex++;
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                    } else {
                                      var radio1 = '';
                                      var radio2 = '';
                                      var radio3 = '';
                                      var radio4 = '';
                                      var radio5 = '';

                                      if (selectedLoan == 0) {
                                        radio1 = 'New purchase';
                                      } else {
                                        radio1 = 'Balance transfer & Top-up';
                                      }

                                      if (selectedWork == 0) {
                                        radio2 = 'Salaried';
                                      } else if (selectedWork == 1) {
                                        radio2 =
                                            'Self-employed non-professional';
                                      } else if (selectedWork == 2) {
                                        radio2 = 'Self-employed professional';
                                      } else if (selectedWork == 3) {
                                        radio2 = 'Propietary concern';
                                      } else if (selectedWork == 4) {
                                        radio2 = 'Partnership concern';
                                      } else {
                                        radio2 =
                                            'Limited liability partnership';
                                      }
                                      if (selectedExistingLoan == 0) {
                                        radio3 = 'HDFC';
                                      } else if (selectedExistingLoan == 1) {
                                        radio3 = 'ICICI';
                                      } else {
                                        radio3 = 'SBI';
                                      }
                                      if (selectedState == 0) {
                                        radio4 = 'Haryana';
                                      } else if (selectedState == 1) {
                                        radio4 = 'Delhi';
                                      } else {
                                        radio4 = 'UP';
                                      }
                                      if (selectedCity == 0) {
                                        radio5 = 'Bhiwani';
                                      } else if (selectedCity == 1) {
                                        radio5 = 'Faridabad';
                                      } else {
                                        radio5 = 'Gurgaon';
                                      }
                                      if (incomeController.text.isEmpty ||
                                          radio1.isEmpty ||
                                          radio2.isEmpty ||
                                          radio3.isEmpty ||
                                          radio4.isEmpty ||
                                          radio5.isEmpty) {
                                        (Get.snackbar(
                                          "Error: Dont leave any field empty",
                                          "Failed",
                                          colorText: Colors.black,
                                        ));
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Result(
                                                    city: radio5,
                                                    existingLoan: radio3,
                                                    income:
                                                        incomeController.text,
                                                    state: radio4,
                                                    loanType: radio1,
                                                    workType: radio2,
                                                  )),
                                        );
                                      }
                                    }
                                  });
                                },
                                icon: const Icon(
                                    size: 22,
                                    color: Colors.white,
                                    Icons.arrow_forward_ios_outlined)),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
