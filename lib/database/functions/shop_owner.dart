import 'package:skar_admin/database/config.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:sqflite/sqflite.dart';

Future<void> createShopOwner(ShopOwner shopOwner) async {
  if (db.isOpen) {
    await db.insert(
      'shop_owners',
      shopOwner.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> deleteShopOwner() async {
  if (db.isOpen) {
    await db.rawDelete('DELETE FROM shop_owners');
  }
}

Future<bool> hasShopOwner() async {
  if (db.isOpen) {
    List<Map<String, dynamic>>? maps = await db.rawQuery(
      "SELECT COUNT(id) as count FROM shop_owners",
    );
    return maps[0]['count'] as int >= 1;
  }
  return false;
}

Future<ShopOwner> getShopOwner() async {
  if (db.isOpen) {
    List<Map<String, dynamic>>? maps = await db.rawQuery(
      "SELECT * FROM shop_owners",
    );

    if (maps.isEmpty) return ShopOwner.defaultShopOwner();
    return ShopOwner.fromJson(maps.first);
  }
  return ShopOwner.defaultShopOwner();
}
