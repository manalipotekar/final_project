import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/utils/custom_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      'assets/pink1.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "title",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Qty 1",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "\$price",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
