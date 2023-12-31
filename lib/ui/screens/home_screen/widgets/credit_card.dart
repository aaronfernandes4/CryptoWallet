import 'package:belo_challenge/providers/user_current_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../../constants.dart';

class CreditCard extends StatelessWidget {
  final availableMoney = Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Consumer(
        builder: (context, watch, child) {
          return Text(
            "INR ${watch(currentMoneyProvider).state.toString()}",
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 25),
          );
        },
      ),
      SizedBox(
        height: 5.0,
      ),
      Text("Available money in local currency: ",
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.normal,
          ))
    ],
  ));

  final userName = Container(
    alignment: Alignment.bottomLeft,
    child: Text(
      "Aditya Rajpathak Vansh Chanchlani Sneha Dahikar Aaron Fernandes", 
      style: TextStyle(color: kSecondaryColor, fontStyle: FontStyle.italic),
    ),
  );

  final bitcoinSvg = Container(
      alignment: Alignment.topRight,
      child: WebsafeSvg.asset("assets/icons/btc.svg", color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[kPrimaryColor, kAccentColor]),
          borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Row(
              children: [
                Expanded(flex: 2, child: availableMoney),
                Expanded(flex: 1, child: bitcoinSvg)
              ],
            ),
          ),
          Spacer(),
          userName
        ],
      ),
    );
  }
}
