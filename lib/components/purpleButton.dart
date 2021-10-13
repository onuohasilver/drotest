import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  final Widget child;
  const PurpleButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          height: size.height * .055,
          width: size.width * .8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: DroColors.purpleGradient),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: size.height * .35,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PurpleButton(
                                  child: Center(
                                child: Text(
                                  'VIEW CART',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              SizedBox(height: size.height * .01),
                              SizedBox(
                                width: size.width * .8,
                                height: size.height * .055,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  onPressed: () {},
                                  child: Text(
                                    'CONTINUE SHOPPING',
                                    style: TextStyle(
                                        color: DroColors.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: child),
          ),
        ),
      ),
    );
  }
}
