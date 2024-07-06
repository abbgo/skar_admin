import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/services/api/brend.dart';

final brendApiProvider = Provider<BrendApiService>((ref) => BrendApiService());
