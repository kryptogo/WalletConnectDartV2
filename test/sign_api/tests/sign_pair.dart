import 'package:flutter_test/flutter_test.dart';
import 'package:walletconnect_flutter_v2/apis/sign_api/i_sign_engine_app.dart';
import 'package:walletconnect_flutter_v2/apis/sign_api/i_sign_engine_common.dart';
import 'package:walletconnect_flutter_v2/apis/sign_api/i_sign_engine_wallet.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

import '../../shared/shared_test_values.dart';

void signPair({
  required Future<ISignEngineApp> Function(PairingMetadata) clientACreator,
  required Future<ISignEngineWallet> Function(PairingMetadata) clientBCreator,
}) {
  group('pair', () {
    late ISignEngineApp clientA;
    late ISignEngineWallet clientB;
    List<ISignEngineCommon> clients = [];

    setUp(() async {
      clientA = await clientACreator(PROPOSER);
      clientB = await clientBCreator(RESPONDER);
      clients.add(clientA);
      clients.add(clientB);
    });

    tearDown(() async {
      clients.clear();
      await clientA.core.relayClient.disconnect();
      await clientB.core.relayClient.disconnect();
    });

    test('throws with v1 url', () {
      const String uri = TEST_URI_V1;

      expect(
        () async => await clientB.pair(uri: Uri.parse(uri)),
        throwsA(
          isA<WalletConnectError>().having(
            (e) => e.message,
            'message',
            'Missing or invalid. URI is not WalletConnect version 2 URI',
          ),
        ),
      );
    });

    test('throws with invalid methods', () {
      const String uriWithMethods = '$TEST_URI&methods=[wc_swag]';

      expect(
        () async => await clientB.pair(uri: Uri.parse(uriWithMethods)),
        throwsA(
          isA<WalletConnectError>().having(
            (e) => e.message,
            'message',
            'Unsupported wc_ method. The following methods are not registered: wc_swag.',
          ),
        ),
      );
    });
  });
}
