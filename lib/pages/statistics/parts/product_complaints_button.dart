import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/product_complaints/product_complaints.dart';
import 'package:skar_admin/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductComplaintsButton extends StatelessWidget {
  const ProductComplaintsButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => goToPage(context, const ProductComplaintsPage(), false),
      child: Card(
        elevation: 6,
        color: elevatedButtonColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
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
              const SizedBox(height: 10),
              Text(
                lang.productComplaints,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
