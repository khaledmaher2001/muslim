import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Constant/components.dart';
import 'package:muslim/Constant/constant.dart';

import 'package:muslim/shared/cubit/cubit.dart';
import 'package:muslim/shared/cubit/states.dart';

class ZekrScreen extends StatelessWidget {
  const ZekrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getZekrData(id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              cubit.stopZekr();
              isClicked = false;
              iconsList.clear();
              return true;
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: KBackgroundColor,
                body: state is! ZekrDetailsDataLoadingState
                    ? SafeArea(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                zekrTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      mainTitleItem(
                                          index: index,
                                          audioOnTap: () {
                                            if (count > 0) {
                                            } else {
                                              oldIndex = index;
                                            }
                                            count++;

                                            cubit.changeButton(
                                                cubit.detailsModel!.zekr![index]
                                                    .audio!
                                                    .replaceRange(
                                                        0, 4, "https"),
                                                index);
                                          },
                                          type: 0,
                                          repeat: cubit.detailsModel!
                                              .zekr![index].repeat!,
                                          title: cubit.detailsModel!
                                              .zekr![index].arabicText!,
                                          context: context),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: cubit.detailsModel!.zekr!.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }
}
