import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/tanah_bloc.dart';
import 'package:tanah_id/model/tanah.dart';
import 'package:tanah_id/pages/tanah/tanah_form.dart';
import 'package:tanah_id/pages/home/home_page.dart';
import 'package:tanah_id/widget/warning_dialog.dart';

class TanahDetail extends StatefulWidget {
  Tanah? tanah;

  TanahDetail({Key? key, this.tanah}) : super(key: key);

  @override
  _TanahDetailState createState() => _TanahDetailState();
}

class _TanahDetailState extends State<TanahDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tanah Tahta'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.tanah!.kodeTanah}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.tanah!.namaTanah}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.tanah!.hargaTanah.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TanahForm(
                            tanah: widget.tanah!,
                          )));
            }),
        //Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //Confirm Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            TanahBloc.deleteTanah(id: int.parse(widget.tanah!.id!)).then(
                (value) => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()))
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => const HomePage()));
                    }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                        description: "Hapus gagal, silahkan coba lagi",
                      ));
            });
          },
        ),
        //Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
