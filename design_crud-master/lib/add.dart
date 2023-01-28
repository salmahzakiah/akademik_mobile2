import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'function/func_getImage.dart';
import 'function/func_add.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? tanggal;
  String? agenda;
  String? tempat;


  TextEditingController ctl_tanggal = TextEditingController();
  TextEditingController ctl_agenda = TextEditingController();
  TextEditingController ctl_tempat = TextEditingController();

  @override
  void initState() {
    setState(() {
      file = null;
      nameFile = "Silahkan pilih gambar";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Tambah Data"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_tanggal,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'tanggal',
                      hintText: "Isi tanggal",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                            onPressed: () {
                              takePicture(ImageSource.gallery, setState);
                            },
                            child: Text("Gallery"),
                            color: Colors.grey)),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.camera, setState);
                      },
                      child: Text("Camera"),
                      color: Colors.brown,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(nameFile),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_agenda,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'agenda',
                      hintText: "agenda",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_tempat,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'tempat',
                      hintText: "tempat",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      CircularProgressIndicator();
                      addData(context, ctl_tanggal.text, ctl_agenda.text,ctl_tempat.text, file);
                    },
                    child: const Text("Simpan"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
