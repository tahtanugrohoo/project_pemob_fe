import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/logout_bloc.dart';
import 'package:tanah_id/bloc/tanah_bloc.dart';
import 'package:tanah_id/model/tanah.dart';
import 'package:tanah_id/pages/login/login_page.dart';
import 'package:tanah_id/pages/tanah/tanah_detail.dart';
import 'package:tanah_id/pages/tanah/tanah_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: FutureBuilder<List>(
        future: TanahBloc.getTanahs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListTanah(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
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
