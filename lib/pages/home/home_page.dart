import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/logout_bloc.dart';
import 'package:tanah_id/bloc/tanah_bloc.dart';
import 'package:tanah_id/models/tanah.dart';
import 'package:tanah_id/pages/login/login_page.dart';
import 'package:tanah_id/pages/tanah/tanah_detail.dart';
import 'package:tanah_id/pages/tanah/tanah_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Daftar data untuk GridView
  final List<Map<String, String>> listTanah = [
    {
      'image': 'assets/tanah1.jpg',
      'title': 'Tanah A',
      'description': 'Lokasi A, Strategis, Luas 1000 m²',
      'price': 'Rp 100.000.000'
    },
    {
      'image': 'assets/tanah2.jpg',
      'title': 'Tanah C',
      'description': 'Lokasi B, Tepi Jalan, Luas 500 m²',
      'price': 'Rp 50.000.000'
    },
    {
      'image': 'assets/tanah2.jpg',
      'title': 'Tanah D',
      'description': 'Lokasi B, Tepi Jalan, Luas 500 m²',
      'price': 'Rp 50.000.000'
    },
    {
      'image': 'assets/tanah2.jpg',
      'title': 'Tanah B',
      'description': 'Lokasi B, Tepi Jalan, Luas 500 m²',
      'price': 'Rp 50.000.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tanah Tahta'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TanahForm()));
                },
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false)
                    });
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          // Body utama dengan Jumbotron
          SingleChildScrollView(
            child: Column(
              children: [
                // Jumbotron
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF075E54),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang di Aplikasi!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Temukan tanah terbaik dengan mudah dan cepat.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // GridView di bawah jumbotron
                GridView.builder(
                  shrinkWrap: true, // Agar GridView tidak membebani layout
                  physics:
                      const NeverScrollableScrollPhysics(), // Matikan scroll GridView
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 kolom dalam GridView
                    crossAxisSpacing: 10.0, // Spasi antar kolom
                    mainAxisSpacing: 10.0, // Spasi antar baris
                    childAspectRatio: 0.85, // Rasio lebar dan tinggi card
                  ),
                  itemCount: listTanah.length,
                  itemBuilder: (context, index) {
                    final tanah = listTanah[index];
                    return MouseRegion(
                      onEnter: (_) {
                        // Memberikan efek hover dengan menambah border atau perubahan warna
                        setState(() {});
                      },
                      onExit: (_) {
                        // Menghapus efek hover saat kursor keluar
                        setState(() {});
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman ProdukDetail
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TanahDetail(
                                // tanah:
                                //     tanah, // Mengirim data tanah ke halaman ProdukDetail
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    tanah['image']!,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    tanah['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: Text(
                                    tanah['description']!,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    tanah['price']!,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Tombol Tambah
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TanahForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF075E54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTanah extends StatelessWidget {
  final List? list;
  const ListTanah({Key? key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemTanah(
            tanah: list![i],
          );
        });
  }
}

class ItemTanah extends StatelessWidget {
  final Tanah tanah;
  const ItemTanah({Key? key, required this.tanah}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TanahDetail(
                      tanah: tanah,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(tanah.namaTanah!),
          subtitle: Text(tanah.hargaTanah.toString()),
        ),
      ),
    );
  }
}
