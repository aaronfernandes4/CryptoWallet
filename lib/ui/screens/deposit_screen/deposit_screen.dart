import 'package:belo_challenge/providers/user_current_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: TextFormField(
            controller: _moneyController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Deposit Amount (Ex: INR 500)",
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          child: Consumer(
            builder: (context, watch, child) {
              return TextButton(
                child: Text("Deposit Amount",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kAccentColor)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {
                  if (_moneyController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Please enter valid amount")));
                  } else {
                    double userMoney = double.parse(_moneyController.text);
                    double userTotalMoneyAfterDeposit =
                        userMoney + watch(currentMoneyProvider).state;
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: Text(
                                "Are you sure you want to deposit ${_moneyController.text} to your account?"),
                            content: Text(
                                "Total deposit: ARS $userTotalMoneyAfterDeposit"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    watch(currentMoneyProvider).state =
                                        userTotalMoneyAfterDeposit;
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "You deposited : ${_moneyController.text}. Total amount : $userTotalMoneyAfterDeposit")));
                                  },
                                  child: Text("Yes",
                                      style: TextStyle(color: kAccentColor))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No",
                                      style: TextStyle(color: kAccentColor)))
                            ],
                          );
                        });
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
