import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Constant/constant.dart';
import 'package:muslim/shared/cubit/cubit.dart';
import 'package:muslim/shared/cubit/states.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          var height=MediaQuery.of(context).size.height;
          return Scaffold(
            backgroundColor: KBackgroundColor,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "السبــــحة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Cairo",
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: KPrimaryColor,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              const Text(
                                "أَسْتَغْفِرُ اللَّهَُ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "عدد التكرار ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontFamily: "Cairo",
                                    ),
                                  ),
                                  Text(
                                    "33",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontFamily: "Cairo",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cubit.zeroCounter();
                            },
                            icon: const Icon(
                              Icons.refresh_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Text(
                            "العدد الكلي : ${cubit.totalCounter} ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      InkWell(
                        onTap: () {
                          if (cubit.counter >= 100) {
                            cubit.zeroCounter();
                          } else {
                            cubit.increase();
                          }
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: height*0.13,
                          backgroundColor: KPrimaryColor,
                          child: Text(
                            "${cubit.counter}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
