import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isShowColorName = true;

  void _rastgeleRenkSec() {
    final colors = renkler.keys.toList();
    final rasgeleSayi = Random().nextInt(colors.length);
    final randomColor = colors[rasgeleSayi];
    setState(() {
      selectedColor = randomColor;
      debugPrint(rasgeleSayi.toString());
    });
  }

  void _renginKodunuGoster() {
    Fluttertoast.showToast(
        msg:
            "RGB: (${selectedColor.red},${selectedColor.green},${selectedColor.blue})",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: selectedColor,
        textColor: Colors.white,
        fontSize: 24.0);
  }

  void _containerSekliniDegistir() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  final Map<Color, String> renkler = {
    Colors.red: 'Kırmızı',
    Colors.blue: 'Mavi',
    Colors.green: 'Yeşil',
    Colors.yellow: 'Sarı',
    Colors.purple: 'mor',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('renk seçici'),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  isShowColorName = !isShowColorName;
                });
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    value: 'data',
                    child: Row(
                      children: [
                        Text('renk adını göster/gizle'),
                      ],
                    ),
                  ),
                ];
              },
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: selectedColor, //secilen renk
                      borderRadius: BorderRadius.circular(
                          isCircular ? 100 : 10), //koseler yuvarlak
                      boxShadow: [
                        BoxShadow(
                          color: selectedColor.withOpacity(// golge rengi
                              0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                isShowColorName
                    ? Text(renkler[selectedColor] ?? 'seçilen renk')
                    : SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<Color>(
                        value: selectedColor,
                        items: renkler.entries.map((entry) {
                          return DropdownMenuItem(
                              value: entry.key,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: entry.key,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(entry.value),
                                ],
                              ));
                        }).toList(), // renklerdeki elemanlara tek tek bak onlari mapla degistir
                        onChanged: (value) {
                          setState(() {
                            selectedColor = value!;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: _rastgeleRenkSec,
                        child: const Text('rastgele'),
                      ),
                      IconButton(
                        onPressed: _renginKodunuGoster,
                        icon: const Icon(Icons.info),
                      ),
                      IconButton(
                        onPressed: () {
                          _containerSekliniDegistir();
                        },
                        icon: Icon(isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
