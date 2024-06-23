import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/database/functions/shop_owner.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/api/shop_owner.dart';
import 'package:skar_admin/providers/pages/login.dart';
import 'package:skar_admin/services/api/shop_owner.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.phoneNumberCtrl,
    required this.passwordCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneNumberCtrl;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool buttonPress = ref.watch(buttonPressProvider);

    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          ref.read(buttonPressProvider.notifier).state = true;

          LoginShopOwnerParams params = LoginShopOwnerParams(
            phoneNumber: '+993${phoneNumberCtrl.text}',
            password: passwordCtrl.text,
          );
          ResultLoginShopOwner result =
              await ref.read(loginShopOwnerProvider(params).future);

          if (result.error != '') {
            if (context.mounted) showSomeErr(context);
            ref.read(buttonPressProvider.notifier).state = false;
            return;
          }

          if (result.responseLoginShopOwner != null) {
            if (result.responseLoginShopOwner!.accessToken == '') {
              if (context.mounted) showUserNotFound(context);
              ref.read(buttonPressProvider.notifier).state = false;
              return;
            }

            ref.read(buttonPressProvider.notifier).state = false;

            bool hasShopOwner = await ref.watch(hasShopOwnerProvider.future);
            if (hasShopOwner) {
              await deleteShopOwner();
            }
            await createShopOwner(result.responseLoginShopOwner!.shopOwner);

            await ref
                .read(accessTokenProvider.notifier)
                .update(result.responseLoginShopOwner!.accessToken);
          }
        }
      },
      child: buttonPress
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : Text(lang.login),
    );
  }
}
