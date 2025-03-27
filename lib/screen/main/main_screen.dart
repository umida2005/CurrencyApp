import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:intl/intl.dart';
import '../copmonent/item.dart';
import 'main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return
          Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppBar(
                backgroundColor: Colors.deepPurple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                title: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: LocaleText(
                        "Valyuta",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                selectDate();
                              },
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          body: switch (state.status) {
            Status.loading => Center(child: CircularProgressIndicator()),
            Status.initial ||Status.success => ListView.builder(
        itemBuilder: (context, index) {state;
        double? isColors =
        double.tryParse(state.list[index].diff.toString()) ?? 0;
        Color color = Colors.red;
        if (isColors > 0) {
        color = Colors.greenAccent;
        }
        return item(
        state.list[index].ccyNmUz ?? '',
        state.list[index].diff ?? '',
        state.list[index].nominal ?? '',
        state.list[index].ccy ?? '',
        state.list[index].rate ?? '',
        state.list[index].date ?? '',
        context,
        color);
        },
        scrollDirection: Axis.vertical,
        itemCount: state.list.length,
        ),
        Status.fail || Status.error || Status.none => Center(child: Text("Ma'lumot topilmadi")),

            null =>Center(child: Text("Ma'lumot topilmadi")) ,
      }

        );
      },
    );
  }



  Future<void> selectDate() async {
    DateTime? _select = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );

    if (_select != null) {
      setState(() {
        var b = DateFormat('yyyy-MM-dd').format(_select);
        context.read<MainBloc>().add(MainCurrencyWithDayEvent(day: b));
      });
    } else {
      setState(() {
        String selectDat = 'Sana tanlash bekor qilindi';
        // do nothing
      });
    }
  }
}
