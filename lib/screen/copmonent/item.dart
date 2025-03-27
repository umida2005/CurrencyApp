import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

Widget item(String countryName, String diff, String sum, String calendar,
    String balance, String day, BuildContext context, Color myColor) {return Card(margin: const EdgeInsets.all(16), elevation: 8, color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Column(
          children: [
            Row(
              children: [
                Text(countryName),
                const SizedBox(
                  width: 8,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  diff,
                  style: TextStyle(color: myColor),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  sum,
                  style: const TextStyle(fontSize: 14),
                ),
                Text("$calendar => ", style: const TextStyle(fontSize: 14)),
                Text("${balance}UZS ", style: const TextStyle(fontSize: 14)),
                const Text("I ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                Image.asset(
                  "assets/images/img.png",
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(day, style: const TextStyle(fontSize: 14))
              ],
            )
          ],
        ),
        children: [
          InkWell(
            onTap: () {
              bottomSheetDialog(
                  context, balance, calendar, countryName, balance);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16, left: 200),
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(
                    10.0), // Set the desired radius here
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/img_1.png",
                      height: 20,
                      width: 22,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
);}

