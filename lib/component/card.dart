import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});
  @override
  Widget build(BuildContext context) {
    String name = 'Test1';
    String village = 'Chiplun';
    String society = '';
    String cardNo = 'ZXS7258031';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelAndTitle(
                  label: 'Name',
                  text: name,
                ),
                const SizedBox(height: 5.0,),
                LabelAndTitle(
                  label: 'Village',
                  text: village,
                ),
                const SizedBox(height: 5.0,),
                LabelAndTitle(
                  label: 'Card No',
                  text: cardNo,
                ),
              ],
            ),
            Column(
              children: [Text('119 / 1'), Text('M / 22')],
            ),
          ],
        ),
      ),
    );
  }
}

class LabelAndTitle extends StatelessWidget {
  final String label;
  final String text;
  const LabelAndTitle({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
          TextSpan(text: '$label: ',),
          TextSpan(
              text: text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,)),
        ]));
  }
}
