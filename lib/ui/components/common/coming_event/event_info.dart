import 'package:flutter/material.dart';
import 'package:vida/constants/theme.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "التفاصيل",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "رحلة اكتشاف الذات",
              style: TextStyle(fontSize: 18),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(width: 8),
            Text("✈️", style: TextStyle(fontSize: 18)),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "استراحة من الجري المتواصل وفرصة للتفكير في ذاتنا و في الحياة 😢",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 8),
        Text(
          "واقع فلسفي ممتع يقوده أ. عماد العاصيلي",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "ندوة مجانية",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(width: 8),
            Text("✅", style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "نطرح فيها الكثير من الأسئلة لأنفسنا قبل الآخرين 🧠⌛",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 12),
        _buildBulletPoint("لماذا نحتاج الفلسفة"),
        _buildBulletPoint("الفلسفة وفن التفكير السليم"),
        _buildBulletPoint("الفلسفة وفن العيش"),
        _buildBulletPoint("الفلسفة وفن التعايش"),
        _buildBulletPoint("عزاء الفلسفة"),
        _buildBulletPoint("كيف تساهم الفلسفة بحل المشكلات (العامة و الخاصة)"),
        _buildBulletPoint("هل من معيار متخصص ان يقيس الفلسفة؟"),
        _buildBulletPoint("ما علاقة الفلسفة بالوعي؟"),
        _buildBulletPoint("كيف تسهم الفلسفة في تكوين معلم او مرشد"),
        _buildBulletPoint("هل ترحبون بدعوتكم؟"),
        SizedBox(height: 16),
        Text(
          "🌟 في انتظاركم لتنضموا إلينا في الرواق الفلسفي، لتكونوا جزءًا من مجتمع VIDA",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.right,
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
          Text(
            text,
            style: TextStyle(fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(width: 8),
          Icon(Icons.circle, size: 8, color: Colors.black54),
        ],
      ),
    );
  }
}
