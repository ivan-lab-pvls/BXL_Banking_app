import 'package:banking_app/model/Income_item.dart';
import 'package:banking_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterIncome extends StatefulWidget {
  const EnterIncome(
      {super.key, required this.callBack, required this.bottomCallBack});
  final Function(IncomeItem) callBack;
  final Function bottomCallBack;

  @override
  State<EnterIncome> createState() => _EnterIncomeState();
}

class _EnterIncomeState extends State<EnterIncome> {
  TextEditingController textControllerDescription = TextEditingController();
  TextEditingController textControllerIncome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 60, 18, 37),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(
                      'Add income',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: Text(
                      'Income description',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(
                            0.6,
                          ),
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onEditingComplete: () {
                        setState(() {});
                      },
                      cursorColor: Colors.white,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15),
                      controller: textControllerDescription,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.03),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(width: 1)),
                          label: Text('Example (Salary)',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white.withOpacity(0.2),
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                    child: Text(
                      'Income amount',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(
                            0.6,
                          ),
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onEditingComplete: () {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      cursorColor: Colors.white,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15),
                      controller: textControllerIncome,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.03),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(width: 1)),
                          label: Text('Enter budget',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white.withOpacity(0.2),
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
                    child: InkWell(
                      onTap: () {
                        if (textControllerDescription.text.isNotEmpty &&
                            textControllerIncome.text.isNotEmpty) {
                          IncomeItem income = IncomeItem();
                          income.description = textControllerDescription.text;
                          income.cost = num.tryParse(textControllerIncome.text)!
                              .toDouble();
                          widget.callBack(income);
                          Navigator.pop(context);
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF475B2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                'Add income',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                          if (textControllerDescription.text.isEmpty ||
                              textControllerIncome.text.isEmpty)
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(17),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomBar(callBack: () {
            Navigator.pop(context);
            widget.bottomCallBack();
          })
        ],
      ),
    );
  }
}
