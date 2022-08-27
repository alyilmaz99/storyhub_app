import 'package:flutter/material.dart';
import '../core/const/text_const/how_to_const.dart';
import '../core/const/text_const/textconst.dart';
import '../view/how_to_detail_view.dart';
import '../view/how_to_page_view.dart';

abstract class HowToPageViewModal extends State<HowToPageView> {
  void pushFunction(String title, String body, IconData icons) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HowToDetailView(
                title: title,
                body: body,
                icons: icons,
              )),
    );
  }

  void pageCheck(String pageName) {
    switch (pageName) {
      case "oyunKuralları":
        {
          pushFunction(
              TextConst.howToPageTitleRule, HowToConst.gameRule1, Icons.rule);
        }
        break;
      case "oyuncuSayısı":
        {
          pushFunction(TextConst.howToPageTitleGamer, HowToConst.gameRule2,
              Icons.person);
        }
        break;
      case "kartDetayları":
        {
          pushFunction(TextConst.howToPageTitleDetail, HowToConst.gameRule3,
              Icons.crop_original_outlined);
        }
        break;
      case "puanlamaSistemi":
        {
          pushFunction(TextConst.howToPageTitlePoint, HowToConst.gameRule4,
              Icons.star_border_outlined);
        }
        break;
      case "nasılOynanır":
        {
          pushFunction(TextConst.howToPageTitlePlay, HowToConst.gameRule5,
              Icons.question_mark);
        }
        break;
      default:
        {
          // ignore: avoid_print
          print("detail page doesn't have data error: 1");
        }
    }
  }
}
