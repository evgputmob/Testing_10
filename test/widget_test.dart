// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      //------------------------------
      // Проверяем форму "Вход"
      expect(find.byKey(Key('fieldEmail')), findsOneWidget);
      expect(find.byKey(Key('fieldPhone')), findsOneWidget);
      expect(find.byKey(Key('fieldFirstName')), findsNothing);
      expect(find.text('Добро пожаловать'), findsNothing);

      await tester.enterText(find.byKey(Key('fieldEmail')), 'test@mail.ru');
      expect(find.text('test@mail.ru'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldPhone')), '777888999');
      expect(find.text('777888999'), findsOneWidget);

      expect(find.byKey(Key('buttonSend')), findsOneWidget);

      await tester.tap(find.byKey(Key('buttonSend')));
      await tester.pump();

      expect(find.text('Добро пожаловать'), findsOneWidget);

      //------------------------------
      // Переключаемся на форму "Регистрация"
      await tester.tap(find.byKey(Key('switchLoginRegForm')));
      await tester.pump();

      expect(find.byKey(Key('fieldFirstName')), findsOneWidget);
      expect(find.byKey(Key('fieldSecondName')), findsOneWidget);
      expect(find.byKey(Key('fieldPhone')), findsOneWidget);
      expect(find.byKey(Key('fieldEmail')), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldFirstName')), 'Ivan');
      expect(find.text('Ivan'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldSecondName')), 'Ivanov');
      expect(find.text('Ivanov'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldEmail')), 'test@gmail.com');
      expect(find.text('test@gmail.com'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldPhone')), '888999777');
      expect(find.text('888999777'), findsOneWidget);

      expect(find.byKey(Key('buttonSend')), findsOneWidget);

      await tester.tap(find.byKey(Key('buttonSend')));
      await tester.pump();

      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
