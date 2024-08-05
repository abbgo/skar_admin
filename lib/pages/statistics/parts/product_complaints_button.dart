import 'package:flutter/material.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductComplaintsButton extends StatelessWidget {
  const ProductComplaintsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 6,
        color: elevatedButtonColor,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.local_mall, color: Colors.white),
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.warning_amber_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'some',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
