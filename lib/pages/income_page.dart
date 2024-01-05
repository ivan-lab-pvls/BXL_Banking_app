import 'dart:convert';

import 'package:banking_app/model/Income_item.dart';
import 'package:banking_app/pages/enter_income.dart';
import 'package:banking_app/pages/home_page.dart';
import 'package:banking_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomePage extends StatefulWidget {
  const IncomePage(
      {super.key, required this.callBack, required this.incomesCallBack});
  final Function callBack;
  final Function(List<IncomeItem>) incomesCallBack;

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  List<IncomeItem> incomes = [];
  @override
  void initState() {
    super.initState();
    getShared();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 60, 18, 0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Income',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 32)),
                    ],
                  ),
                ),
                if (incomes.isNotEmpty)
                  Expanded(child: SingleChildScrollView(child: getIncomes())),
                if (incomes.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'No information on income yet',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          'Click on the "Add income" button',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 72, 20, 18),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        EnterIncome(
                                          bottomCallBack: () {
                                            widget.callBack();
                                          },
                                          callBack: (income) {
                                            incomes.add(income);
                                            widget.incomesCallBack(incomes);
                                            addToShared(incomes);
                                            setState(() {});
                                          },
                                        )),
                              );
                            },
                            child: Container(
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
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
        if (page == EPageOnSelect.incomePage && incomes.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 18),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => EnterIncome(
                            bottomCallBack: () {
                              widget.callBack();
                            },
                            callBack: (income) {
                              incomes.add(income);
                              widget.incomesCallBack(incomes);
                              addToShared(incomes);
                              setState(() {});
                            },
                          )),
                );
              },
              child: Container(
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
            ),
          ),
        BottomBar(callBack: () {
          widget.callBack();
        })
      ],
    );
  }

  Widget getIncomes() {
    List<Widget> list = [];
    for (var income in incomes) {
      list.add(Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '\$${income.cost!.toStringAsFixed(0)}',
              style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFFF475B2),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            income.description!,
            style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
        ]),
      ));
    }
    return Column(
      children: list,
    );
  }

  Future<void> addToShared(
    List<IncomeItem>? incomeList,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (incomeList != null) {
      prefs.setString('incomeList', jsonEncode(incomeList));
    }
  }

  void getShared() async {
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData =
        jsonDecode(prefs.getString('incomeList') ?? '[]');

    incomes = jsonData.map<IncomeItem>((jsonList) {
      {
        return IncomeItem.fromJson(jsonList);
      }
    }).toList();
    setState(() {});
  }
}
