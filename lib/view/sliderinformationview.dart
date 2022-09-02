import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodel/sliderinformationviewmodel.dart';

class SliderInformationView extends StatefulWidget {
  const SliderInformationView({Key? key}) : super(key: key);

  @override
  State<SliderInformationView> createState() => _SliderInformationViewState();
}

class _SliderInformationViewState extends SliderInformationViewModel {
  @override
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
          controller: controller,
          itemCount: OnboardingItems.loadOnboardingItem().length,
          itemBuilder: (BuildContext context, int index) {
            OnboardingItem oi = OnboardingItems.loadOnboardingItem()[index];
            return Container(
              height: screenHeight,
              width: screenWidth,
              color: oi.color,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != 0
                          ? IconButton(
                              onPressed: previousSlide,
                              icon: const Icon(Icons.chevron_left),
                              color: const Color.fromRGBO(36, 10, 63, 1),
                            )
                          : const SizedBox(
                              width: 5,
                              height: 5,
                            ),
                      TextButton(
                          onPressed: onDonePress,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 187, 171, 205)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          child: const Text(
                            "Tanıtımı Atla",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    ],
                  ),
                  SizedBox(
                      height: screenHeight * 0.3, child: Image.asset(oi.image)),
                  Column(
                    children: [
                      Text(
                        oi.title,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        oi.subtitle,
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: nextSlide,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          color: Colors.deepPurple)))),
                      child:
                          Text(index == 2 ? "Oynamaya Hazırsın!" : "Devam Et")),
                  SizedBox(
                    width: 50,
                    height: 10,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: OnboardingItems.loadOnboardingItem().length,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: index == i ? 15 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: index == i
                                  ? const Color.fromRGBO(36, 10, 63, 1)
                                  : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
