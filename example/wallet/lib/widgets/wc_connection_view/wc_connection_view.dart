import 'package:flutter/material.dart';
import 'package:walletconnect_flutter_v2_wallet/utils/constants.dart';
import 'package:walletconnect_flutter_v2_wallet/widgets/wc_connection_view/wc_connection_info.dart';
import 'package:walletconnect_flutter_v2_wallet/widgets/wc_connection_view/wc_connection_model.dart';

class WCConnectionView extends StatelessWidget {
  const WCConnectionView({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final List<WCConnectionModel> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleConstants.layerColor1,
        borderRadius: BorderRadius.circular(
          StyleConstants.linear8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(title),
          const SizedBox(height: 8),
          ...info.map(
            (e) => WCConnectionInfo(
              model: e,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      decoration: BoxDecoration(
        color: StyleConstants.layerBubbleColor2,
        borderRadius: BorderRadius.circular(
          StyleConstants.linear8,
        ),
      ),
      padding: StyleConstants.bubblePadding,
      child: Text(
        text,
        style: StyleConstants.layerTextStyle3,
      ),
    );
  }
}
