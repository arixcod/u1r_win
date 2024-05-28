import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class OrderSuccesScreen extends StatelessWidget {
  const OrderSuccesScreen(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.appbarHieght),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(
                height: Tsizes.spacebtwnitems,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Tsizes.spacebtwnitems,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Tcolors.primaryColorbtnshade,
                        side: BorderSide.none),
                    onPressed: onPressed,
                    child: Text("Continue Shopping")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
