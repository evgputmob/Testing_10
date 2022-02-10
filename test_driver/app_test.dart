// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests: ', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver?.close();
    });

    final fieldEmail = find.byValueKey('fieldEmail');
    final fieldPhone = find.byValueKey('fieldPhone');
    final buttonSend = find.byValueKey('buttonSend');

    test('Email field', () async {
      await driver!.tap(fieldEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ivanov@example.com');
      await driver!.waitFor(find.text('ivanov@example.com'));
    });

    test('Phone field', () async {
      await driver!.tap(fieldPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('123456789');
      await driver!.waitFor(find.text('123456789'));
    });

    test('Button "Send" press', () async {
      await driver!.tap(buttonSend);
    });

    test('Welcome text', () async {
      final welcomeText = find.text('Добро пожаловать');
      expect(await driver!.getText(welcomeText), 'Добро пожаловать');
    });
  });

  //============================================

  group('Rigister form tests: ', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver?.close();
    });

    final buttonSwitchToReg = find.byValueKey('switchLoginRegForm');
    final fieldFirstName = find.byValueKey('fieldFirstName');
    final fieldSecondName = find.byValueKey('fieldSecondName');
    final fieldEmail = find.byValueKey('fieldEmail');
    final fieldPhone = find.byValueKey('fieldPhone');
    final buttonSend = find.byValueKey('buttonSend');

    test('Switch to the registration form', () async {
      await driver!.tap(buttonSwitchToReg);
      final regFormHeader = find.text('Регистрация');
      expect(await driver!.getText(regFormHeader), 'Регистрация');
    });

    test('FirstName field', () async {
      await driver!.tap(fieldFirstName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ivan');
      await driver!.waitFor(find.text('ivan'));
    });

    test('SecondName field', () async {
      await driver!.tap(fieldSecondName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ivanov');
      await driver!.waitFor(find.text('ivanov'));
    });

    test('Email field', () async {
      await driver!.tap(fieldEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ivanov@example.com');
      await driver!.waitFor(find.text('ivanov@example.com'));
    });

    test('Phone field', () async {
      await driver!.tap(fieldPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('123456789');
      await driver!.waitFor(find.text('123456789'));
    });

    test('Button "Send" press test', () async {
      await driver!.tap(buttonSend);
    });

    test('Success text test', () async {
      final successText = find.text('Вы успешно зарегистрировались');
      expect(
          await driver!.getText(successText), 'Вы успешно зарегистрировались');
    });
  });
}
