import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_d_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});
  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  int _currentIndex = 2;

  final List<Map<String, String>> _contacts = [
    {'name': 'ธนาคารกรุงเทพ', 'number': '1333', 'image': 'assets/images/1333.png'},
    {'name': 'ธนาคารออมสิน', 'number': '1115', 'image': 'assets/images/1115.png'},
    {'name': 'ธนาคารกสิกรไทย', 'number': '028888888', 'image': 'assets/images/kasikorn.png'},
    {'name': 'ธนาคารกรุงไทย', 'number': '021111111', 'image': 'assets/images/krugthai.png'},
    {'name': 'ธนาคารกรุงศรี', 'number': '1572', 'image': 'assets/images/krungsri.png'},
    {'name': 'ธนาคารทีเอ็มบีธนชาติ', 'number': '1428', 'image': 'assets/images/ttb.png'},
    {'name': 'Citibank', 'number': '1588', 'image': 'assets/images/citybank.png'},
    {'name': 'LH Bank', 'number': '1327', 'image': 'assets/images/lhbank.png'},
    {'name': 'ธนาคารอาคารสงเคราะห์ ธอส', 'number': '026459000', 'image': 'assets/images/trs.png'},
    {'name': 'ธนาคารไทยพาณิชย์', 'number': '027777777', 'image': 'assets/images/scb.png'},
    {'name': 'ธนาคารเกียรตินาคินภัทร', 'number': '021655555', 'image': 'assets/images/kkp.png'},
    {'name': 'ธนาคารไทยเครดิต', 'number': '026975454', 'image': 'assets/images/thaicredit.png'},
    {'name': 'UOB', 'number': '022851555', 'image': 'assets/images/uob.png'},
    {'name': 'TISCO', 'number': '026336000', 'image': 'assets/images/tisco.png'},
    {'name': 'ธนาคารอิสลาม', 'number': '022042766', 'image': 'assets/images/alsalam.png'},
    {'name': 'ธนาคารซีไอเอ็มบี ไทย', 'number': '026267777', 'image': 'assets/images/cimb.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final accent = Colors.greenAccent;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('สายด่วน THAILAND', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
        centerTitle: true, backgroundColor: Colors.transparent, elevation: 0,
        flexibleSpace: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0F2027).withOpacity(0.8), Color(0xFF2C5364).withOpacity(0.8)]))))),
        actions: [IconButton(icon: Icon(Icons.info_outline, color: Colors.cyanAccent), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUi())))],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)])),
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight + 10),
          Padding(padding: EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(width: double.infinity, padding: EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.2))),
                  child: Column(children: [
                    Text('สายด่วน', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('ธนาคาร', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accent)),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4), itemCount: _contacts.length,
            itemBuilder: (context, i) => _buildGlassCard(_contacts[i]['name']!, _contacts[i]['number']!, _contacts[i]['image']!, accent),
          )),
        ]),
      ),
      bottomNavigationBar: _buildGlassBottomNav(),
    );
  }

  Widget _buildGlassBottomNav() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF0F2027), boxShadow: [BoxShadow(color: Colors.cyanAccent.withOpacity(0.1), blurRadius: 20, offset: Offset(0, -5))]),
      child: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white.withOpacity(0.05), selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.white.withOpacity(0.4), selectedFontSize: 10, unselectedFontSize: 10, elevation: 0,
          onTap: (i) {
            if (i == _currentIndex) return;
            final d = [SubAHomeUi(), SubBHomeUi(), SubCHomeUi(), SubDHomeUi()];
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => d[i]));
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'การเดินทาง'),
            BottomNavigationBarItem(icon: Icon(Icons.warning_amber_rounded), label: 'อุบัติเหตุ+ฉุกเฉิน'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: 'สาธารณูปโภค'),
          ],
        ),
      )),
    );
  }

  Widget _buildGlassCard(String name, String number, String imagePath, Color accent) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withOpacity(0.15))),
            child: ListTile(
              onTap: () async { final uri = Uri(scheme: 'tel', path: number); if (await canLaunchUrl(uri)) await launchUrl(uri); },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: Container(width: 50, height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white.withOpacity(0.1), border: Border.all(color: Colors.white.withOpacity(0.2))),
                child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover)),
              ),
              title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
              subtitle: Text(number, style: TextStyle(fontSize: 13, color: accent.withOpacity(0.8))),
              trailing: Container(width: 40, height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withOpacity(0.15), border: Border.all(color: accent.withOpacity(0.3))),
                child: Icon(Icons.phone, color: accent, size: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}