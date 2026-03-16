import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.data, required this.text,});
  final List<String> data;
  final String text;
  @override
  Widget build(BuildContext context) {
    RxInt ? selectIndex = 0.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Obx(()=>InkWell(
                onTap: (){
                  selectIndex.value = index;
                  print(data[index]);
                },
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: selectIndex == index ? AppColor.colorPrimary :Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(data[index]),
                ),
              ));
            },
          ),
        )
      ],
    );
  }
}