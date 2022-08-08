import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BottomSheetModel extends StatefulWidget {
  const BottomSheetModel({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetModel> createState() => _BottomSheetModelState();
}

class _BottomSheetModelState extends State<BottomSheetModel> {
  double sliderValue = 77;

  changeValue(sliderV) {
    setState(() {
      sliderValue = sliderV;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.95,
      decoration: const BoxDecoration(
        color: Color(0xff121212),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity: 0, child: IconButton(onPressed: () {}, icon: const Icon(Icons.close))),
                Container(
                  height: 5,
                  width: 75,
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.equalizer,
                      size: 40,
                      color: Color(0xff1DB954),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Current Device",
                            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "TUNAHAN",
                              style: TextStyle(color: Color(0xff1DB954), fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_horiz,
                  size: 25,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Connect to a device",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Spotify needs to access your local network to find your devices.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff1DB954),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Allow access",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Other devices",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          // child: CircularProgressIndicator(
                          //   strokeWidth: 1,
                          //   color: Colors.white,
                          // ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.wifi_tethering,
                          size: 30,
                        ),
                      ),
                      Text(
                        "AirPlay or Bluetooth",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          color: const Color(0xff282828),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Smart a remote group session",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Listen with friends in different places",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.volume_up),
                SizedBox(
                  width: context.width * 0.85,
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return Slider(
                        value: sliderValue,
                        min: 0,
                        max: 100,
                        thumbColor: Colors.white,
                        activeColor: const Color(0xff1DB954),
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
