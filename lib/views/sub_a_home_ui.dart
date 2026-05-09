import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/sub_d_home_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  int _currentIndex = 0;

  final List<Map<String, String>> _contacts = [
    {'name': 'กรมทางหลวงชนบท', 'number': '1146', 'image': 'assets/images/DRR-Logo.png'},
    {'name': 'ตำรวจท่องเที่ยว', 'number': '1155', 'image': 'assets/images/touris-police.png'},
    {'name': 'ตำรวจทางหลวง', 'number': '1193', 'image': 'assets/images/highwaypolice.png'},
    {'name': 'ข้อมูลจราจร', 'number': '1197', 'image': 'assets/images/icon_traffic_info.png'},
    {'name': 'ขสมก.', 'number': '1348', 'image': 'assets/images/bmtalogo.png'},
    {'name': 'บขส.', 'number': '1490', 'image': 'assets/images/bks.png'},
    {'name': 'เส้นทางบนทางด่วน', 'number': '1543', 'image': 'assets/images/icon_expressway.png'},
    {'name': 'กรมทางหลวง', 'number': '1586', 'image': 'assets/images/highwaydept.png'},
    {'name': 'การรถไฟแห่งประเทศไทย', 'number': '1690', 'image': 'assets/images/railway.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F2027).withOpacity(0.8),
                    Color(0xFF2C5364).withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.cyanAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUi()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight + 10),
            // ส่วนหัว - Glass header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'สายด่วน',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'การเดินทาง',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            // รายการสายด่วน
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return _buildGlassContactCard(
                    _contacts[index]['name']!,
                    _contacts[index]['number']!,
                    _contacts[index]['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildGlassBottomNav(),
    );
  }

  Widget _buildGlassBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0F2027),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.05),
            selectedItemColor: Colors.cyanAccent,
            unselectedItemColor: Colors.white.withOpacity(0.4),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            elevation: 0,
            onTap: (index) {
              if (index == _currentIndex) return;
              Widget destination;
              switch (index) {
                case 0:
                  destination = SubAHomeUi();
                  break;
                case 1:
                  destination = SubBHomeUi();
                  break;
                case 2:
                  destination = SubCHomeUi();
                  break;
                case 3:
                  destination = SubDHomeUi();
                  break;
                default:
                  return;
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_car),
                label: 'การเดินทาง',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warning_amber_rounded),
                label: 'อุบัติเหตุ+ฉุกเฉิน',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'ธนาคาร',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build),
                label: 'สาธารณูปโภค',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassContactCard(String name, String number, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 1,
              ),
            ),
            child: ListTile(
              onTap: () async {
                final Uri telUri = Uri(scheme: 'tel', path: number);
                if (await canLaunchUrl(telUri)) {
                  await launchUrl(telUri);
                }
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                number,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.cyanAccent.withOpacity(0.8),
                ),
              ),
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyanAccent.withOpacity(0.15),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.3),
                  ),
                ),
                child: Icon(
                  Icons.phone,
                  color: Colors.cyanAccent,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}