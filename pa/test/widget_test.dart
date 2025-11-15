import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pa/main.dart'; // Pastikan path ini benar

void main() {
  testWidgets('App should display welcome page on startup', (WidgetTester tester) async {
    await tester.pumpWidget(const RoseDiseaseApp());

    expect(find.text('MawarSehat AI'), findsOneWidget);
    expect(find.text('Identifikasi penyakit pada daun bunga mawar dengan AI'), findsOneWidget);
    
    expect(find.text('Selamat datang!'), findsOneWidget);
    
    expect(find.text('Masuk ke Aplikasi'), findsOneWidget);
    
    expect(find.text('Email'), findsNothing);
    expect(find.text('Kata Sandi'), findsNothing);
  });

  testWidgets('Enter button should navigate to dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const RoseDiseaseApp());

    await tester.tap(find.text('Masuk ke Aplikasi'));
    await tester.pumpAndSettle();

    expect(find.text('Pilih cara untuk memulai'), findsOneWidget);
    expect(find.text('Unggah foto atau jelajahi pustaka'), findsOneWidget);
    expect(find.text('Unggah Foto'), findsOneWidget);
    expect(find.text('Jelajahi Pustaka Penyakit'), findsOneWidget);
  });

  testWidgets('Dashboard should navigate to upload photo page', (WidgetTester tester) async {
    await tester.pumpWidget(const RoseDiseaseApp());

    await tester.tap(find.text('Masuk ke Aplikasi'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Mulai Deteksi'));
    await tester.pumpAndSettle();

    expect(find.text('Unggah Foto Daun Mawar'), findsOneWidget);
    expect(find.text('Ambil atau unggah foto untuk deteksi'), findsOneWidget);
  });
}