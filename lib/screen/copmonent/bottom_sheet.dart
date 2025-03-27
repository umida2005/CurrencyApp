import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void bottomSheetDialog(BuildContext context, String code, String ccy, String country, String sum) {
  var get = TextEditingController();
  bool isCLick = false;
  get.text = '1';

  final add = TextEditingController();
  var chet = ccy;
  var bi = "UZB";
  add.text = code.toString();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(

          padding: const EdgeInsets.all(8.0)
              .copyWith(bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
          child: Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: 56,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.black12),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                    child: Text(
                      country,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        ValueListenableBuilder<TextEditingValue>(
                            valueListenable: get,
                            builder: (context, value, chaild) {
                              return TextField(
                                keyboardType: TextInputType.number,
                                controller: get,
                                onChanged: (value) {
                                  if (isCLick == true) {
                                    double firstValue =
                                        double.tryParse(value) ?? 0.0;
                                    double first = double.tryParse(code) ?? 0.0;
                                    print(first.toString());
                                    double secondValue =
                                    first != 0 ? firstValue / first : 0.0;
                                    add.text = (secondValue / first).toString();


                                    add.text = secondValue.toString();
                                  } else if (isCLick == false) {
                                    double firstValue =
                                        double.tryParse(value) ?? 0.0;
                                    double addFirst =
                                        double.tryParse(code.toString()) ?? 0.0;
                                    double secondValue = firstValue * addFirst;
                                    add.text = secondValue.toString();
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: chet,
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(16.0),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2)),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                              );
                            }),
                        const SizedBox(height: 16),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: add,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            labelText: bi,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(16.0),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    var d = get.text;
                    var n = int.parse(d);
                    get.text = add.text;
                    add.text = n.toString();
                    isCLick = !isCLick;
                    if (!isCLick) {
                      chet = ccy;
                      bi = "UZB";
                    } else {
                      chet = "UZB";
                      bi = ccy;
                      print("mm" + chet);
                      print("44" + ccy);
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple,
                    ),
                    child: Image.asset(
                      'assets/images/img_2.png',
                      width: 5,
                      height: 5,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
