import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_d_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  int _currentIndex = 1;

  final List<Map<String, String>> _contacts = [
    {'name': 'เหตุด่วนเหตุร้าย', 'number': '191', 'image': 'assets/images/191.png'},
    {'name': 'แจ้งไฟไหม้ สัตว์เข้าบ้าน', 'number': '199', 'image': 'assets/images/199.png'},
    {'name': 'สายด่วนรถหาย(ตำรวจแห่งชาติ)', 'number': '1192', 'image': 'assets/images/1192.png'},
    {'name': 'อุบัติเหตุทางน้ำ', 'number': '1196', 'image': 'assets/images/1196.png'},
    {'name': 'แจ้งคนหาย', 'number': '1300', 'image': 'assets/images/1300.png'},
    {'name': 'ศูนย์ปลอดภัยคมนาคม', 'number': '1356', 'image': 'assets/images/1356.png'},
    {'name': 'หน่วยแพทย์กู้ชีพ', 'number': '1554', 'image': 'assets/images/1554.png'},
    {'name': 'ศูนย์เอราวัณ', 'number': '1646', 'image': 'assets/images/1646.png'},
    {'name': 'เจ็บป่วยฉุกเฉิน', 'number': '1669', 'image': 'assets/images/1669.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'อุบัติเหตุ+เหตุฉุกเฉิน', Colors.orangeAccent);
  }

  Widget _buildPage(BuildContext context, String subtitle, Color accent) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight + 10),
            _buildGlassHeader(subtitle, accent),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                itemCount: _contacts.length,
                itemBuilder: (context, index) => _buildGlassCard(
                  _contacts[index]['name']!, _contacts[index]['number']!, _contacts[index]['image']!, accent,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildGlassBottomNav(),
    );
  }

  PreferredSizeWidget _buildGlassAppBar() {
    return AppBar(
      title: Text('สายด่วน THAILAND', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
      centerTitle: true, backgroundColor: Colors.transparent, elevation: 0,
      flexibleSpace: ClipRect(
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0F2027).withOpacity(0.8), Color(0xFF2C5364).withOpacity(0.8)]))),
        ),
      ),
      actions: [IconButton(icon: Icon(Icons.info_outline, color: Colors.cyanAccent), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUi())))],
    );
  }

  Widget _buildGlassHeader(String subtitle, Color accent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(width: double.infinity, padding: EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.2))),
            child: Column(children: [
              Text('สายด่วน', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(subtitle, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accent)),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassBottomNav() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF0F2027), boxShadow: [BoxShadow(color: Colors.cyanAccent.withOpacity(0.1), blurRadius: 20, offset: Offset(0, -5))]),
      child: ClipRect(
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: BottomNavigationBar(
            currentIndex: _currentIndex, type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.05), selectedItemColor: Colors.cyanAccent,
            unselectedItemColor: Colors.white.withOpacity(0.4), selectedFontSize: 10, unselectedFontSize: 10, elevation: 0,
            onTap: (i) {
              if (i == _currentIndex) return;
              final destinations = [SubAHomeUi(), SubBHomeUi(), SubCHomeUi(), SubDHomeUi()];
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => destinations[i]));
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'การเดินทาง'),
              BottomNavigationBarItem(icon: Icon(Icons.warning_amber_rounded), label: 'อุบัติเหตุ+ฉุกเฉิน'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
              BottomNavigationBarItem(icon: Icon(Icons.build), label: 'สาธารณูปโภค'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard(String name, String number, String imagePath, Color accent) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
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