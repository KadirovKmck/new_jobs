import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_jobs/app/views/home_views/views/add_subscription_view.dart';

class ActiveAndInactiveWidget extends StatefulWidget {
  const ActiveAndInactiveWidget({super.key, required this.addNextPeyment});
  final AddNextPeyment addNextPeyment;
  @override
  State<ActiveAndInactiveWidget> createState() =>
      _ActiveAndInactiveWidgetState();
}

class _ActiveAndInactiveWidgetState extends State<ActiveAndInactiveWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.95,
          height: heigth * 0.040,
          padding: const EdgeInsets.all(2),
          decoration: ShapeDecoration(
            color: const Color(0xFF434343),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x7F00010C),
                blurRadius: 6,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              _buildButton(
                text: 'Active',
                isSelected: isActive,
                onTap: () {
                  setState(() {
                    isActive = true;
                  });
                },
              ),
              _buildButton(
                text: 'Inactive',
                isSelected: !isActive,
                onTap: () {
                  setState(() {
                    isActive = false;
                  });
                },
              ),
            ],
          ),
        ),
        widget.addNextPeyment.addNextPeymentCost.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: SvgPicture.asset('assets/icons/text.svg'),
                ),
              )
            : SizedBox(
                height: heigth * 0.5,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.addNextPeyment.addNextPeymentSiteUrl.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: heigth * 0.071,
                        padding: EdgeInsets.only(
                          left: width * 0.012,
                          top: heigth * 0.010,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF3B3B3B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.09,
                              height: heigth * 0.036,
                              child: SvgPicture.asset(
                                isActive
                                    ? 'assets/icons/icon_youtube.svg'
                                    : 'assets/icons/spotify_icon.svg',
                              ),
                            ),
                            SizedBox(width: width * 0.012),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isActive
                                      ? widget.addNextPeyment
                                          .addNextPeymentSiteUrl[index]
                                      : "Spotify",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.050,
                                  ),
                                ),
                                Text(
                                  'Last paid ${widget.addNextPeyment.addNextPeymentCost[index]}\$ on ${widget.addNextPeyment.addNextPeymentDate[index]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.033,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: width * 0.08,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        //            SizedBox(
        //   height: heigth * 0.5,
        //   width: double.infinity,
        //   child: ListView.builder(
        //     itemCount: timeActive.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: EdgeInsets.symmetric(vertical: heigth * 0.010),
        //         child: Container(
        //           width: double.infinity,
        //           height: heigth * 0.071,
        //           padding: EdgeInsets.only(
        //             left: width * 0.012,
        //             top: width * 0.020,
        //           ),
        //           decoration: ShapeDecoration(
        //             color: const Color(0xFF3B3B3B),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //             shadows: const [
        //               BoxShadow(
        //                 color: Color(0x3F000000),
        //                 blurRadius: 4,
        //                 offset: Offset(0, 4),
        //                 spreadRadius: 0,
        //               ),
        //             ],
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               SizedBox(
        //                 width: width * 0.15,
        //                 height: heigth * 0.036,
        //                 child: SvgPicture.asset(
        // isActive
        //     ? 'assets/icons/${imageActive[index]}.svg'
        //     : 'assets/icons/spotify_icon.svg',
        //                 ),
        //               ),
        //               SizedBox(width: width * 0.012),
        //               Expanded(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       isActive ? titleActive[index] : 'Spotify',
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: width * 0.040,
        //                       ),
        //                     ),
        //                     Text(
        //                       isActive
        //                           ? timeActive[index]
        //                           : 'Last paid 7\$ on 16 October,2022',
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: width * 0.034,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               SizedBox(width: width * 0.042),
        //               Icon(
        //                 Icons.keyboard_arrow_down,
        //                 size: width * 0.07,
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  bool isActive = true;

  final titleActive = <String>[
    'YouTube',
    'YouTube',
    'Spotify',
    'YouTube',
    'YouTube',
    'YouTube',
  ];
  final imageActive = <String>[
    'icon_youtube',
    'icon_youtube',
    'spotify_icon',
    'icon_youtube',
    'icon_youtube',
    'icon_youtube',
  ];
  final timeActive = <String>[
    'Last paid 9\$ on 10 October,2022',
    'Last paid 9\$ on 10 October,2022',
    'Last paid 7\$ on 16 October,2022',
    'Last paid 9\$ on 10 October,2022',
    'Last paid 9\$ on 10 October,2022',
    'Last paid 9\$ on 10 October,2022',
  ];

  Widget _buildButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.455,
        height: height * 0.033,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.006,
          horizontal: width * 0.075,
        ),
        decoration: ShapeDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: isSelected
                ? BorderSide.none
                : BorderSide(
                    width: 0.5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.black.withOpacity(0.04),
                  ),
          ),
          shadows: isSelected
              ? null
              : const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 1,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  )
                ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : const Color(0xFF828282),
              fontSize: width * 0.030,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              height: 0.12,
            ),
          ),
        ),
      ),
    );
  }
}
