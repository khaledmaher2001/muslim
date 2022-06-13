import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/shared/cubit/cubit.dart';
import 'package:muslim/shared/cubit/states.dart';

class FehrsScreen extends StatelessWidget {
  const FehrsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        item(model: cubit.quranModel, index: index),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: cubit.quranModel.length,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget item({
    required List model,
    int index = 0,
  }) =>
      Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text("${index + 1}"),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "${model[index]['titleAr']}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  "أيــاتها",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "cairo",
                  ),
                ),
                Text("${model[index]['count']}"),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            model[index]['place'] == 'Mecca'
                ? Image.asset(
                    "assets/icons/kaaba.png",
                    width: 30,
                  )
                : Image.asset(
                    "assets/icons/mosque2.png",
                    width: 30,
                  ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "${model[index]['pages']}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}
