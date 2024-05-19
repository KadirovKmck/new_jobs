import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveAndInactiveWidget extends StatefulWidget {
  const ActiveAndInactiveWidget({super.key});

  @override
  State<ActiveAndInactiveWidget> createState() =>
      _ActiveAndInactiveWidgetState();
}

class _ActiveAndInactiveWidgetState extends State<ActiveAndInactiveWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 32,
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
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 450,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: width,
                  height: 71,
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 10,
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
                        width: width * 0.15,
                        height: 36.70,
                        child: SvgPicture.asset(
                          isActive
                              ? 'assets/icons/${imageActive[index]}.svg'
                              : 'assets/icons/spotify_icon.svg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isActive ? titleActive[index] : 'Spotify',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              isActive
                                  ? timeActive[index]
                                  : 'Last paid 7\$ on 16 October,2022',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 42),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
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
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        height: 28,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7.5),
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
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              height: 0.12,
            ),
          ),
        ),
      ),
    );
  }
}
