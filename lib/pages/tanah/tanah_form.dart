import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/tanah_bloc.dart';
import 'package:tanah_id/models/tanah.dart';
import 'package:tanah_id/pages/home/home_page.dart';
import 'package:tanah_id/widget/warning_dialog.dart';

class TanahForm extends StatefulWidget {
  Tanah? tanah;

  TanahForm({Key? key, this.tanah}) : super(key: key);

  @override
  _TanahFormState createState() => _TanahFormState();
}

class _TanahFormState extends State<TanahForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH TANAH TAHTA";
  String tombolSubmit = "SIMPAN";

  final _kodeTanahTextboxController = TextEditingController();
  final _namaTanahTextboxController = TextEditingController();
  final _hargaTanahTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.tanah != null) {
      setState(() {
        judul = "UBAH TANAH TAHTA";
        tombolSubmit = "UBAH";
        _kodeTanahTextboxController.text = widget.tanah!.kodeTanah!;
        _namaTanahTextboxController.text = widget.tanah!.namaTanah!;
        _hargaTanahTextboxController.text =
            widget.tanah!.hargaTanah.toString();
      });
    } else {
      judul = "TAMBAH TANAH TAHTA";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeTanahTextField(),
                _namaTanahTextField(),
                _hargaTanahTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Kode Tanah
  Widget _kodeTanahTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Tanah"),
      keyboardType: TextInputType.text,
      controller: _kodeTanahTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Tanah harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Nama Tanah
  Widget _namaTanahTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Tanah"),
      keyboardType: TextInputType.text,
      controller: _namaTanahTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Tanah harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Harga Tanah
  Widget _hargaTanahTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaTanahTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.tanah != null) {
                //kondisi update tanah
                ubah();
              } else {
                //kondisi tambah tanah
                simpan();
              }
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Tanah createTanah = Tanah(id: null);
    createTanah.kodeTanah = _kodeTanahTextboxController.text;
    createTanah.namaTanah = _namaTanahTextboxController.text;
    // createTanah.hargaTanah = int.parse(_hargaTanahTextboxController.text);
    createTanah.hargaTanah =
        int.tryParse(_hargaTanahTextboxController.text) ?? 0;

    TanahBloc.addTanah(tanah: createTanah).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Tanah updateTanah = Tanah(id: widget.tanah!.id!);
    updateTanah.kodeTanah = _kodeTanahTextboxController.text;
    updateTanah.namaTanah = _namaTanahTextboxController.text;
    // updateTanah.hargaTanah = int.parse(_hargaTanahTextboxController.text);
    updateTanah.hargaTanah =
        int.tryParse(_hargaTanahTextboxController.text) ?? 0;

    TanahBloc.updateTanah(tanah: updateTanah).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
