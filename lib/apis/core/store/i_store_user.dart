import 'package:walletconnect_flutter_v2/apis/core/i_core.dart';

abstract class IStoreUser {
  abstract final ICore core;
  abstract final String storageKey;
  Future<void> restore();
  Future<void> persist();
}
