import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin/SonucEkrani.dart';


class TahminEkrani extends StatefulWidget {
  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController();
  var KalanHak = 5;
  var RastgeleSayi = 0;
  var yonlendir = "0-50 Sayı Giriniz";

  @override
  void initState() {
    super.initState();
    RastgeleSayi = Random().nextInt(51);
    print(RastgeleSayi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text(
              "Kalan Hak : $KalanHak",
              style: TextStyle(color: Colors.black54, fontSize: 30),
            ),
             Text(
              "İpucu :  $yonlendir",
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
            Padding(
              padding:  EdgeInsets.all(10.0),
              child:  TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  labelText: "Tahmin Giriniz",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {

                      setState(() {
                        KalanHak = KalanHak - 1 ;
                      });

                      int tahmin = int.parse(tfTahmin.text);

                      if(tahmin == RastgeleSayi){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(true)));
                        return;
                      }

                      if(tahmin > RastgeleSayi){
                        yonlendir = "Tahmini Azalt";
                      }

                      if(tahmin < RastgeleSayi){
                        yonlendir = "Tahmini Arttır";
                      }

                      if(KalanHak == 0){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(false)));
                      }




                      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani()));
                    },
                    child: const Text("Tahmin Et")))
          ],
        ),
      ),
    );
  }
}
