import 'package:flutter/material.dart';

import '../constants.dart';

class CusttomButton extends StatelessWidget {
  const CusttomButton({super.key, required this.onTap,  this.isloading =false});
  final void Function() onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Center(
            child: isloading ? const SizedBox(height: 24,width: 24,child:  CircularProgressIndicator(color: Colors.black,)) :const Text(
          'Add',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
