import 'package:crafty_bay/feature/common/common_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReview extends StatelessWidget {
  const AddReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Review"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 50.h,),
            TextFormField(
              decoration:InputDecoration(
                hintText: "First Name",
              )
            ),
            SizedBox(height: 10.h,),
            TextFormField(
                decoration:InputDecoration(
                  hintText: "Last Name",
                )
            ),
            SizedBox(height: 10.h,),
            TextFormField(
                decoration:InputDecoration(
                  hintText: "Write review",
                ),
              maxLines: 9,
            ),
            SizedBox(height: 20.h,),
            CommonNextButton(text: "Add Review", call: (){})
          ],
        )),
      ),
    );
  }
}
