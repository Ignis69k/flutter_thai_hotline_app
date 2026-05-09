import 'dart:ui';
import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});
  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('สายด่วน THAILAND', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
        centerTitle: true, backgroundColor: Colors.transparent, elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.1), border: Border.all(color: Colors.white.withOpacity(0.2))),
            child: Icon(Icons.arrow_back, color: Colors.cyanAccent, size: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0F2027).withOpacity(0.8), Color(0xFF2C5364).withOpacity(0.8)]))))),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)])),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight + 20),
                // หัวข้อ ผู้จัดทำ
                Text('ผู้จัดทำ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(color: Colors.cyanAccent.withOpacity(0.4), blurRadius: 15)])),
                SizedBox(height: 24),
                // Glass container for university logo
                ClipRRect(borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 170, height: 120, padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.2))),
                      child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('assets/images/Logosau.png', fit: BoxFit.contain)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('มหาวิทยาลัยเอเชียอาคเนย์', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.9))),
                SizedBox(height: 30),
                // Glass profile picture
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.cyanAccent.withOpacity(0.2), blurRadius: 30, spreadRadius: 5)],
                    border: Border.all(color: Colors.cyanAccent.withOpacity(0.4), width: 3)),
                  child: CircleAvatar(radius: 80, backgroundColor: Colors.grey[800], backgroundImage: AssetImage('assets/images/aboutui.png')),
                ),
                SizedBox(height: 30),
                // Glass info card
                Padding(padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: double.infinity, padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.15))),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          _infoRow(Icons.badge, 'รหัสนักศึกษา', '6852D10018'),
                          SizedBox(height: 14),
                          _infoRow(Icons.person, 'ชื่อ-สกุล', 'นายปฐมพงษ์ จันทร์สมบูรณ์'),
                          SizedBox(height: 14),
                          _infoRow(Icons.email, 'อีเมล์', 'S6852D10018@sau.ac.th'),
                          SizedBox(height: 14),
                          _infoRow(Icons.school, 'สาขาวิชา', 'เทคโนโลยีดิจิทัลและนวัตกรรม'),
                          SizedBox(height: 14),
                          _infoRow(Icons.account_balance, 'คณะ', 'ศิลปศาสตร์และวิทยาศาสตร์'),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: Colors.cyanAccent, size: 20),
      SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5))),
        SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
      ])),
    ]);
  }
}