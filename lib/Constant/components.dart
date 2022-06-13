import 'package:flutter/material.dart';

import 'constant.dart';

Widget mainTitleItem(
        {required String title,
        int repeat = 0,
        final void Function()? onTap,
        final void Function()? audioOnTap,
        int type = 0,
          int index=0,
        required BuildContext context}) =>
    Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,

        child: Container(
          // width: MediaQuery.of(context).size.width * 0.90,
          color: KPrimaryColor,

          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              type == 0
                  ? Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "عدد التكرار : $repeat ",
                            style: const TextStyle(
                              color: KBackgroundColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: audioOnTap,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon:  Icon(
                              iconsList[index],
                              color: Colors.white,
                              size: 32,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
