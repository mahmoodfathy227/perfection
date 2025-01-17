
import 'package:flutter/material.dart';

import '../responsive.dart';
import '../styles/styles.dart';

class UpgradeProSection extends StatelessWidget {
  const UpgradeProSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.defaultPrimaryColor,
        borderRadius: Styles.defaultBorderRadius,
      ),
      padding: EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      children: [
                        const TextSpan(
                          text: "New Updates Soon: ",

                        ),
                        TextSpan(
                          text: "PRO+",
                          style: TextStyle(
                            color: Styles.defaultRedColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: !Responsive.isMobile(context),
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: "Get Ready  "),
                            TextSpan(
                              text: "For+ ",
                              style: TextStyle(
                                color: Styles.defaultRedColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  "New Updates Soon To Web Version",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/astranaut.png"),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
