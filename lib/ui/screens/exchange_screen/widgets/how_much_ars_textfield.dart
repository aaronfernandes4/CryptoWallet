import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/exchange_screen.dart';
import '../../../../constants.dart';

class HowMuchArsTextField extends StatelessWidget {
  const HowMuchArsTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Consumer(
              builder: (context, watch, child) {
                return Consumer(
                  builder: (context, watch, child) {
                    return Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Send: (Ex: INR 500)",
                            errorText: watch(validateTransaction).state
                                ? null
                                : "Select a currency and the amount"),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            watch(howMuchArsSelected).state =
                                double.parse(value);
                            watch(howMuchReceive).state;
                          } else {
                            watch(howMuchReceive).state;
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          //Coin Image
          Expanded(
              flex: 2,
              child: Consumer(
                builder: (context, watch, child) {
                  return Text("Select how much you want to pay with");
                },
              )),
        ],
      ),
    );
  }
}
