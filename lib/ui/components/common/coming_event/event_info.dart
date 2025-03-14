import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "التفاصيل",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 8),
          _buildRow("رحلة لاكتشاف الذات", Icons.flight, Colors.blue),
          SizedBox(height: 8),
          _buildText(
            "استراحة من الجري المتواصل وفرصة للتفكير في ذاتنا وحياتنا.",
          ),
          SizedBox(height: 8),
          _buildRow(
            "واقع فلسفي ممتع يقوده أ. عماد العاصيلي",
            Icons.lightbulb,
            Colors.yellow,
          ),
          SizedBox(height: 8),
          _buildRow("ندوة مجانية", Icons.check_circle, Colors.green),
          SizedBox(height: 8),
          _buildText("تطرح العديد من الأسئلة العميقة حول الذات والآخرين."),
          SizedBox(height: 12),
          _buildBulletPoint("أهمية الفلسفة في حياتنا اليومية"),
          _buildBulletPoint("الفلسفة كأداة للتفكير السليم والتعايش"),
          _buildBulletPoint("كيف تساعد الفلسفة في حل المشكلات؟"),
          _buildBulletPoint("العلاقة بين الفلسفة والوعي"),
          _buildBulletPoint("دور الفلسفة في بناء المعلم والمرشد"),
          SizedBox(height: 16),
          _buildRow(
            "بانتظاركم في الرواق الفلسفي، لتكونوا جزءًا من مجتمع VIDA!",
            Icons.star,
            Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String text, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(icon, size: 20, color: color),
        SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.circle, size: 8, color: Colors.yellow),
          SizedBox(width: 8),
          Flexible(
            // Prevents overflow
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      textAlign: TextAlign.right,
    );
  }
}
