import 'package:flutter/material.dart';

void main() => runApp(const SmartHouseIndia());

const navy = Color(0xFF0B2D59);
const blue = Color(0xFF1769D2);
const green = Color(0xFF16A765);
const orange = Color(0xFFFF8A22);
const purple = Color(0xFF7252CC);

class SmartHouseIndia extends StatelessWidget {
  const SmartHouseIndia({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SMART HOUSE INDIA',
    theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: blue), scaffoldBackgroundColor: const Color(0xFFF5F8FC)),
    home: const MainScreen(),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tab = 0;
  bool kannada = true;
  String t(String en, String kn) => kannada ? kn : en;

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      listPage(t('Home Services', 'ಮನೆ ಸೇವೆಗಳು'), [
        ('Electrician', 'ವಿದ್ಯುತ್ ಕೆಲಸ', 'From ₹299', Icons.electrical_services),
        ('Plumber', 'ಪ್ಲಂಬರ್', 'From ₹249', Icons.plumbing),
        ('AC repair', 'ಎಸಿ ರಿಪೇರಿ', 'From ₹699', Icons.ac_unit),
        ('Home cleaning', 'ಮನೆ ಸ್ವಚ್ಛತೆ', 'From ₹499', Icons.cleaning_services),
        ('Carpenter', 'ಮರಗೆಲಸ', 'From ₹349', Icons.carpenter),
      ]),
      listPage(t('Smart Store', 'ಸ್ಮಾರ್ಟ್ ಸ್ಟೋರ್'), [
        ('Smart LED Bulb', 'ಸ್ಮಾರ್ಟ್ ಎಲ್‌ಇಡಿ ಬಲ್ಬ್', '₹499', Icons.lightbulb),
        ('Wi-Fi CCTV Camera', 'ವೈ-ಫೈ ಸಿಸಿಟಿವಿ ಕ್ಯಾಮೆರಾ', '₹2,999', Icons.videocam),
        ('Smart Plug', 'ಸ್ಮಾರ್ಟ್ ಪ್ಲಗ್', '₹899', Icons.power),
        ('Smart Door Lock', 'ಸ್ಮಾರ್ಟ್ ಡೋರ್ ಲಾಕ್', '₹4,999', Icons.lock),
      ]),
      smartPage(),
      profilePage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('🏠 SMART HOUSE INDIA', style: TextStyle(color: navy, fontWeight: FontWeight.w900, fontSize: 18)),
        actions: [TextButton(onPressed: () => setState(() => kannada = !kannada), child: Text(kannada ? 'English' : 'ಕನ್ನಡ'))],
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), label: t('Home', 'ಮುಖಪುಟ')),
          NavigationDestination(icon: const Icon(Icons.handyman_outlined), label: t('Services', 'ಸೇವೆಗಳು')),
          NavigationDestination(icon: const Icon(Icons.shopping_bag_outlined), label: t('Store', 'ಸ್ಟೋರ್')),
          NavigationDestination(icon: const Icon(Icons.wifi_tethering), label: t('Smart Home', 'ಸ್ಮಾರ್ಟ್ ಮನೆ')),
          NavigationDestination(icon: const Icon(Icons.person_outline), label: t('Profile', 'ಪ್ರೊಫೈಲ್')),
        ],
      ),
    );
  }

  Widget homePage() => ListView(padding: const EdgeInsets.all(16), children: [
    Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [navy, blue]), borderRadius: BorderRadius.circular(24)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t('Your home, in your hands!', 'ನಿಮ್ಮ ಮನೆ, ನಿಮ್ಮ ಕೈಯಲ್ಲಿ!'), style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(t('Home services • Smart products • Security', 'ಮನೆ ಸೇವೆಗಳು • ಸ್ಮಾರ್ಟ್ ಉತ್ಪನ್ನಗಳು • ಭದ್ರತೆ'), style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 14),
        const Icon(Icons.house_rounded, size: 72, color: Colors.white),
      ]),
    ),
    const SizedBox(height: 20),
    Text(t('What do you need today?', 'ನಿಮಗೆ ಏನು ಬೇಕು?'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: navy)),
    const SizedBox(height: 12),
    GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.15, children: [
      feature(Icons.handyman, blue, t('Home Services', 'ಮನೆ ಸೇವೆಗಳು'), t('Book a professional', 'ಸೇವೆಯನ್ನು ಬುಕ್ ಮಾಡಿ'), 1),
      feature(Icons.shopping_cart, green, t('Smart Store', 'ಸ್ಮಾರ್ಟ್ ಸ್ಟೋರ್'), t('Browse products', 'ಉತ್ಪನ್ನಗಳನ್ನು ನೋಡಿ'), 2),
      feature(Icons.wifi, orange, t('Smart Home', 'ಸ್ಮಾರ್ಟ್ ಮನೆ'), t('Device controls', 'ಸಾಧನ ನಿಯಂತ್ರಣ'), 3),
      feature(Icons.shield, purple, t('Home Security', 'ಮನೆ ಭದ್ರತೆ'), t('Security options', 'ಭದ್ರತಾ ಆಯ್ಕೆಗಳು'), 3),
    ]),
    const SizedBox(height: 18),
    Text(t('Popular services', 'ಜನಪ್ರಿಯ ಸೇವೆಗಳು'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy)),
    serviceTile('Electrician', 'ವಿದ್ಯುತ್ ಕೆಲಸ', 'From ₹299', Icons.electrical_services),
    serviceTile('Plumber', 'ಪ್ಲಂಬರ್', 'From ₹249', Icons.plumbing),
    serviceTile('AC service', 'ಎಸಿ ಸೇವೆ', 'From ₹699', Icons.ac_unit),
  ]);

  Widget feature(IconData icon, Color color, String title, String sub, int destination) => InkWell(
    onTap: () => setState(() => tab = destination),
    borderRadius: BorderRadius.circular(18),
    child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x0D001B3A), blurRadius: 12, offset: Offset(0, 4))]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(backgroundColor: color.withOpacity(.13), child: Icon(icon, color: color)),
      const Spacer(),
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: navy, fontSize: 16)),
      const SizedBox(height: 4),
      Text(sub, style: const TextStyle(color: Colors.black54, fontSize: 12)),
    ])),
  );

  Widget listPage(String heading, List<(String, String, String, IconData)> items) => ListView(padding: const EdgeInsets.all(16), children: [
    Text(heading, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
    const SizedBox(height: 12),
    for (final item in items)
      Card(color: Colors.white, child: ListTile(
        leading: CircleAvatar(backgroundColor: const Color(0xFFEAF2FF), child: Icon(item.$4, color: blue)),
        title: Text(kannada ? item.$2 : item.$1),
        subtitle: Text(item.$3),
        trailing: FilledButton(onPressed: () => showDemo('This is a demo. Connect the backend to enable this action.'), child: Text(t('Select', 'ಆಯ್ಕೆ'))),
      )),
  ]);

  Widget serviceTile(String en, String kn, String price, IconData icon) => Card(color: Colors.white, child: ListTile(
    leading: CircleAvatar(backgroundColor: const Color(0xFFEAF2FF), child: Icon(icon, color: blue)),
    title: Text(t(en, kn)), subtitle: Text(price), trailing: const Icon(Icons.chevron_right),
    onTap: () => showDemo('Demo only: connect the booking backend to enable real bookings.'),
  ));

  Widget smartPage() => ListView(padding: const EdgeInsets.all(16), children: [
    Text(t('Smart Home Control', 'ಸ್ಮಾರ್ಟ್ ಮನೆ ನಿಯಂತ್ರಣ'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
    const SizedBox(height: 8),
    Text(t('Real controls require compatible devices and integration.', 'ನಿಜವಾದ ನಿಯಂತ್ರಣಕ್ಕೆ ಹೊಂದಾಣಿಕೆಯ ಸಾಧನಗಳ ಸಂಪರ್ಕ ಅಗತ್ಯ.'), style: const TextStyle(color: Colors.black54)),
    for (final item in [('Lights', Icons.lightbulb_outline), ('Fan', Icons.toys), ('Air Conditioner', Icons.ac_unit), ('CCTV Camera', Icons.videocam), ('Smart Lock', Icons.lock_outline)])
      Card(color: Colors.white, child: SwitchListTile(value: false, onChanged: (_) => showDemo('Demo only: IoT integration is not connected.'), secondary: Icon(item.$2, color: blue), title: Text(item.$1), subtitle: const Text('Not connected'))),
    const SizedBox(height: 8),
    const Text('Security note: never connect real locks or cameras without secure device authentication.', style: TextStyle(color: Colors.redAccent)),
  ]);

  Widget profilePage() => ListView(padding: const EdgeInsets.all(16), children: [
    const CircleAvatar(radius: 40, backgroundColor: Color(0xFFEAF2FF), child: Icon(Icons.person, size: 46, color: blue)),
    const SizedBox(height: 12),
    const Center(child: Text('SMART HOUSE INDIA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: navy))),
    const SizedBox(height: 20),
    Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.login), title: Text(t('Login / Register', 'ಲಾಗಿನ್ / ನೋಂದಣಿ')), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen(kannada: kannada)))),
    ),
    Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.receipt_long), title: Text(t('My bookings and orders', 'ನನ್ನ ಬುಕ್ಕಿಂಗ್ ಮತ್ತು ಆರ್ಡರ್‌ಗಳು')), onTap: () => showDemo('Connect Firebase to show real bookings and orders.'))),
    Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.admin_panel_settings), title: Text(t('Admin dashboard (demo)', 'ನಿರ್ವಾಹಕ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ (ಡೆಮೊ)')), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminScreen())))),
    Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.language), title: Text(t('Language: Kannada', 'ಭಾಷೆ: ಕನ್ನಡ')), trailing: const Icon(Icons.swap_horiz), onTap: () => setState(() => kannada = !kannada))),
  ]);

  void showDemo(String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class LoginScreen extends StatelessWidget {
  final bool kannada;
  const LoginScreen({super.key, required this.kannada});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login / Register')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Icon(Icons.home_work, size: 70, color: blue),
      const Center(child: Text('SMART HOUSE INDIA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy))),
      const SizedBox(height: 24),
      const TextField(decoration: InputDecoration(labelText: 'Mobile number or email', border: OutlineInputBorder())),
      const SizedBox(height: 12),
      const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
      const SizedBox(height: 16),
      FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Demo only: Firebase Authentication is not connected.'))), child: const Text('Continue')),
      const SizedBox(height: 8),
      const Text('Demo UI only. No login details are saved.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
    ]),
  );
}

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin Dashboard — Demo')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Business overview', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
      const SizedBox(height: 12),
      const Wrap(spacing: 12, runSpacing: 12, children: [
        Metric(label: 'Bookings', value: '0', icon: Icons.handyman),
        Metric(label: 'Orders', value: '0', icon: Icons.shopping_bag),
        Metric(label: 'Revenue', value: '₹0', icon: Icons.currency_rupee),
        Metric(label: 'Providers', value: '0', icon: Icons.people),
      ]),
      const SizedBox(height: 18),
      const Text('Demo dashboard only. Secure admin roles, database, and audit logs must be implemented before launch.', style: TextStyle(color: Colors.redAccent)),
    ]),
  );
}

class Metric extends StatelessWidget {
  final String label, value; final IconData icon;
  const Metric({super.key, required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(width: 155, child: Card(color: Colors.white, child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: blue), const SizedBox(height: 10), Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text(label)]))));
}
