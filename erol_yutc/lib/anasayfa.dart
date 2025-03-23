import 'package:flutter/material.dart';
import 'package:erol_yutc/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran Genişliği : $ekranGenisligi");
    print("Ekran Yüksekliği : $ekranYuksekligi");

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/betiyemek.png", width: 100, height: 100,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("4 ${d!.urun}", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 30, color: yaziRenk1),),
                Text(d.enYeni,style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 20, color: yaziRenk2),),
              ],
            ),

            KartChip(
                yemekResimDosyaUzantisi: "ay_coregi.jpg",
                yemekAdi: d.ayCoregi,
                yemekTuru: d.corek,
                yemekFiyat: d.fiyatAyCoregi,
                ekranGenisligi: ekranGenisligi,
                ekranYuksekligi: ekranYuksekligi
            ),
            KartChip(
                yemekResimDosyaUzantisi: "havuclu_tarcinli_kek.jpg",
                yemekAdi: d.havucluTarcinliKek,
                yemekTuru: d.kek,
                yemekFiyat: d.fiyatTarcinliHavucluKek,
                ekranGenisligi: ekranGenisligi, ekranYuksekligi: ekranYuksekligi
            ),
            KartChip(
                yemekResimDosyaUzantisi: "kut_boregi.jpg",
                yemekAdi: d.kutBoregi,
                yemekTuru: d.borek,
                yemekFiyat: d.fiyatKutBoregi,
                ekranGenisligi: ekranGenisligi, ekranYuksekligi: ekranYuksekligi
            ),
            KartChip(
                yemekResimDosyaUzantisi: "limonlu_kek.jpg",
                yemekAdi: d.limonluKek,
                yemekTuru: d.kek,
                yemekFiyat: d.fiyatLimonluKek,
                ekranGenisligi: ekranGenisligi, ekranYuksekligi: ekranYuksekligi
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: ekranGenisligi/1.2,
                        height: 40,
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: d.kuponKullan,
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            hintStyle: TextStyle(color: yaziRenk2, fontFamily: "Montserrat"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: yaziRenk2),
                            ),
                          )
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        d.fiyatToplam,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: yaziRenk1,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                                backgroundColor: anaRenk,
                            ),
                            child: Text(
                              d.odeme,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: butonYaziRenk
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class KartChip extends StatelessWidget{
  final String yemekResimDosyaUzantisi;
  final String yemekAdi;
  final String yemekTuru;
  final String yemekFiyat;
  final double ekranGenisligi;
  final double ekranYuksekligi;


  KartChip({required this.yemekResimDosyaUzantisi, required this.yemekAdi,required this.yemekTuru,required this.yemekFiyat, required this.ekranGenisligi, required this.ekranYuksekligi});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
            child: Image.asset(
              "images/$yemekResimDosyaUzantisi",
              width: ekranGenisligi/3.7,
              height: ekranGenisligi/3.7,
              fit: BoxFit.cover,
            )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: ekranGenisligi/34.25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ekranGenisligi/2,
                      child:
                        Text(
                          yemekAdi,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: yaziRenk1,
                          ),
                          softWrap: true,
                        )

                  ),
                  Row(
                      children: [
                        Text(
                          yemekTuru,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: anaRenk,
                          ),
                        )
                      ]
                  ),
                  Row(
                    children: [
                      Text(
                        yemekFiyat,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: yaziRenk1,
                        ),
                      ),
                      SizedBox(width: ekranGenisligi/18,),
                      TextButton(
                          onPressed: (){},
                          style: TextButton.styleFrom(
                              backgroundColor: anaRenk,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )
                          ),
                          child: Text(
                            "Buy",
                            style: TextStyle(color: butonYaziRenk,fontSize: 13, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                          )
                      )
                    ],
                  ),
                ]
            ),
          ),
        ),
        Column(
          children: [

            IconButton(
                onPressed: (){},
                icon: Icon(Icons.keyboard_arrow_up_rounded, color: anaRenk)
            ),
            TextButton(onPressed: (){},
              style: TextButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: anaRenk,
                  padding: EdgeInsets.all(10)),
              child: Text("1",style: TextStyle(color: butonYaziRenk, fontFamily: "Montserrat"),),
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: anaRenk,)
            ),
          ],
        )
      ],
    );
  }

}