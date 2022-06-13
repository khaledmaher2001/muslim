import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Constant/components.dart';
import 'package:muslim/Constant/constant.dart';
import 'package:muslim/modules/zekr/zekr_screen.dart';
import 'package:muslim/shared/cubit/cubit.dart';
import 'package:muslim/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getMainTitlesData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: KBackgroundColor,
              body: state is! GetMainTitlesDataLoadingState
                  ? SafeArea(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "الأذكـــــار",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.white,
                                fontFamily: "Cairo"
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10),
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => mainTitleItem(
                                  type: 1,
                                  onTap: (){
                                    id=cubit.mainTitlesModel!.arabic![index].id!;
                                    zekrTitle=cubit.mainTitlesModel!.arabic![index].title!;
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ZekrScreen()));

                                  },
                                  title: cubit.mainTitlesModel!.arabic![index].title!,
                                  context: context,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 5,
                                ),
                                itemCount:
                                    cubit.mainTitlesModel!.arabic!.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
