import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Constant/constant.dart';

import 'package:muslim/modules/home_page/home_page_screen.dart';
import 'package:muslim/modules/quran/quran_screen.dart';
import 'package:muslim/modules/zekr/zekr_screen.dart';
import 'package:muslim/sebha/sebha_screen.dart';
import 'package:muslim/shared/cubit/cubit.dart';
import 'package:muslim/shared/cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getMainTitlesData()
        ..startAudio('sound/sound.mp3'),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: KBackgroundColor,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .05,
                          vertical: MediaQuery.of(context).size.height * .03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "أذكـر",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo"),
                          ),
                          const Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: KPrimaryColor,
                      ),
                      child: const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "الَذِينَ آمَنُواْ وَتَطْمَئِنُ قُلُوبُهُم بِذِكْرِ اللَهِ أَلاَ بِذِكْرِ اللَهِ تَطْمَئِنُ الْقُلُوبُ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .05,
                            vertical: MediaQuery.of(context).size.height * .03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                itemCard(
                                  context: context,
                                  title: "أذكار النوم",
                                  icon: "assets/icons/sleep.png",
                                  onTap: () {
                                    cubit.stop();
                                    id = cubit.mainTitlesModel!.arabic![1].id!;
                                    zekrTitle =
                                        cubit.mainTitlesModel!.arabic![1].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZekrScreen()));
                                    print(id);
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .03,
                                ),
                                itemCard(
                                  context: context,
                                  title: "أذكار الصباح والمساء",
                                  icon: "assets/icons/day-and-night.png",
                                  onTap: () {
                                    cubit.stop();
                                    id = cubit.mainTitlesModel!.arabic![0].id!;
                                    zekrTitle =
                                        cubit.mainTitlesModel!.arabic![0].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZekrScreen()));
                                  },
                                ),
                                // itemCard(context),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                itemCard(
                                  context: context,
                                  title: "أذكار الاذان",
                                  icon: "assets/icons/mosque.png",
                                  onTap: () {
                                    cubit.stop();
                                    id = cubit.mainTitlesModel!.arabic![12].id!;
                                    zekrTitle =
                                        cubit.mainTitlesModel!.arabic![12].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZekrScreen()));
                                    print(id);
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .03,
                                ),
                                itemCard(
                                  context: context,
                                  title: "أذكار الاستيقاظ",
                                  icon: "assets/icons/wake-up.png",
                                  onTap: () {
                                    cubit.stop();
                                    id = cubit.mainTitlesModel!.arabic![2].id!;
                                    zekrTitle =
                                        cubit.mainTitlesModel!.arabic![2].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZekrScreen()));
                                    print(id);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                itemCard(
                                  context: context,
                                  title: "القران الكريم",
                                  icon: "assets/icons/quran.png",
                                  onTap: () {
                                    cubit.stop();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QuranScreen()));
                                    print(id);
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .03,
                                ),
                                itemCard(
                                  context: context,
                                  title: "الأذكار بعد الصلاة",
                                  icon: "assets/icons/prayer.png",
                                  onTap: () {
                                    cubit.stop();
                                    id = cubit.mainTitlesModel!.arabic![26].id!;
                                    zekrTitle =
                                        cubit.mainTitlesModel!.arabic![26].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ZekrScreen()));
                                    print(id);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                itemCard(
                                  context: context,
                                  icon: "assets/icons/more.png",
                                  title: "أخري",
                                  onTap: () {
                                    cubit.stop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()));
                                    print(id);
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .03,
                                ),
                                itemCard(
                                  context: context,
                                  title: "سبحة",
                                  icon: "assets/icons/tasbih.png",
                                  onTap: () {
                                    cubit.stop();
                                    // id = cubit.mainTitlesModel!.arabic![26].id!;
                                    // zekrTitle =
                                    //     cubit.mainTitlesModel!.arabic![26].title!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SebhaScreen()));
                                    print(id);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemCard({
    required BuildContext context,
    required String title,
    final void Function()? onTap,
    String? icon,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.87 / 2,
          height: MediaQuery.of(context).size.height / 7,
          color: KPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                     Expanded(
                        flex: 2,
                        child: Image.asset(
                          icon!,
                          width: MediaQuery.of(context).size.width * 0.151,
                          height: 60,
                        ),
                      )
                   ,
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
