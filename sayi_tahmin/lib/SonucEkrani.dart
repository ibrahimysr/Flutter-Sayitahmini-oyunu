import 'dart:math';

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;

  SonucEkrani(this.sonuc);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuc Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 220,
                height: 220,
                child: widget.sonuc
                    ? Image.asset("resimler/mutluresim.png")
                    : Image.asset("resimler/mutsuzresim.png")),
            Text(
              widget.sonuc ? "Kazandınız" : "Kaybettiniz",
              style: TextStyle(color: Colors.black54, fontSize: 30),
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Tekrar Oyna")))
          ],
        ),
      ),
    );
  }
}
