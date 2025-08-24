import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/add_lead/add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/add_lead/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/import_lead.dart/import_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/import_lead.dart/import_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/login/login_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AddLeadsProvider()),
                ChangeNotifierProvider(create: (_) => ImportLeadsProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRM DraivF',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
