import 'package:flutter_test/flutter_test.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

import '../shared/shared_test_values.dart';
import 'utils/signature_constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthSignature', () {
    test('isValidEip191Signature', () async {
      // print('Actual Sig: ${EthSigUtil.signPersonalMessage(
      //   message: Uint8List.fromList(TEST_MESSAGE_EIP191.codeUnits),
      //   privateKey: TEST_PRIVATE_KEY_EIP191,
      // )}');

      final cacaoSig = CacaoSignature(
        t: CacaoSignature.EIP191,
        s: TEST_SIG_EIP191,
      );

      final bool = await AuthSignature.verifySignature(
        TEST_ADDRESS_EIP191,
        TEST_MESSAGE_EIP191,
        cacaoSig,
        TEST_ETHEREUM_CHAIN,
        TEST_PROJECT_ID,
      );

      // print(bool);
      expect(bool, true);

      final cacaoSig2 = CacaoSignature(
        t: CacaoSignature.EIP191,
        s: TEST_SIGNATURE_FAIL,
      );

      final bool2 = await AuthSignature.verifySignature(
        TEST_ADDRESS_EIP191,
        TEST_MESSAGE_EIP191,
        cacaoSig2,
        TEST_ETHEREUM_CHAIN,
        TEST_PROJECT_ID,
      );

      // print(bool);
      expect(bool2, false);
    });

    // TODO: Fix this test, can't call http requests from within the test
    // test('isValidEip1271Signature', () async {
    //   final cacaoSig = CacaoSignature(
    //     t: CacaoSignature.EIP1271,
    //     s: TEST_SIG_EIP1271,
    //   );

    //   final bool = await AuthSignature.verifySignature(
    //     TEST_ADDRESS_EIP1271,
    //     TEST_MESSAGE_EIP1271,
    //     cacaoSig,
    //     TEST_ETHEREUM_CHAIN,
    //     TEST_PROJECT_ID,
    //   );

    //   // print(bool);
    //   expect(bool, true);

    //   final cacaoSig2 = CacaoSignature(
    //     t: CacaoSignature.EIP1271,
    //     s: TEST_SIGNATURE_FAIL,
    //   );

    //   final bool2 = await AuthSignature.verifySignature(
    //     TEST_ADDRESS_EIP1271,
    //     TEST_MESSAGE_EIP1271,
    //     cacaoSig2,
    //     TEST_ETHEREUM_CHAIN,
    //     TEST_PROJECT_ID,
    //   );

    //   // print(bool);
    //   expect(bool2, false);
    // });
  });
}
