import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:storyhub/core/components/senaryo/Senaryo.dart';



class SenaryoService {

  var jsonst;
  late List<Senaryo> _senaryolar;
  bool isLoadedSenaryolar = false;

  List<Senaryo> get senaryolar => _senaryolar;
  set senaryolar(List<Senaryo> senaryolar) {
    _senaryolar = senaryolar;
  }

  static final SenaryoService _senaryolarService= SenaryoService._internal();

  SenaryoService._internal();

  factory SenaryoService() {
    return _senaryolarService;
  }

  void initSenaryolar() async {
    jsonst = await rootBundle.loadString('assets/senaryolar.json');

    Iterable iterateSenaryo = json.decode(jsonst);
    senaryolar = List<Senaryo>.from(iterateSenaryo.map((model)=> Senaryo.fromJson(model)));

    isLoadedSenaryolar = true;
  }

  List<Senaryo> getSenaryolar() {
    if(senaryolar.isEmpty)
    {
      initSenaryolar();
    }

    return senaryolar;
  }



}