import 'package:authentication_ui/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomTextFormField appends @mail.nknu.edu.tw to input',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(
            hinttext: 'Email',
            obsecuretext: false,
            controller: controller,
            decoration: InputDecoration(
              suffixText: '@mail.nknu.edu.tw',
            ),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), '411077033');
    await tester.pump();

    expect(controller.text, '411077033@mail.nknu.edu.tw');
  });
}
