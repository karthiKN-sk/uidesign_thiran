// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

verticalSpace(double? height) {
  return SizedBox(height: height);
}

horizontalSpace(double? width) {
  return SizedBox(width: width);
}

class AppSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? safeWidth;
  static double? safeHeight;
  static late double scaleFactorWidth;
  static late double scaleFactorHeight;

  //Custom ss
  static double? s0;
  static double? s1;
  static late double s2;
  static late double s3;
  static double? s4;
  static double? s5;
  static double? s6;
  static late double s7;
  static double? s8;
  static double? s9;
  static double? s10;
  static double? s11;
  static double? s12;
  static double? s13;
  static double? s14;
  static double? s15;
  static double? s16;
  static double? s17;
  static double? s18;
  static double? s19;
  static double? s20;
  static double? s21;
  static double? s22;
  static double? s23;
  static double? s24;
  static double? s25;
  static double? s26;
  static double? s27;
  static double? s28;
  static double? s29;
  static double? s30;
  static double? s32;
  static late double s34;
  static double? s35;
  static double? s36;
  static double? s38;
  static double? s40;
  static double? s42;
  static double? s44;
  static double? s45;
  static double? s48;
  static double? s50;
  static double? s52;
  static double? s54;
  static double? s56;
  static double? s60;
  static double? s64;
  static double? s68;
  static double? s70;
  static double? s72;
  static double? s76;
  static double? s80;
  static double? s84;
  static double? s88;
  static double? s90;
  static double? s96;
  static double? s100;
  static double? s105;
  static double? s106;
  static double? s110;
  static double? s115;
  static double? s120;
  static double? s124;
  static double? s130;
  static double? s135;
  static double? s138;
  static double? s140;
  static double? s145;
  static double? s150;
  static double? s155;
  static double? s160;
  static double? s166;
  static double? s170;
  static double? s180;
  static double? s190;
  static double? s200;
  static double? s205;
  static double? s206;
  static double? s207;
  static double? s208;
  static double? s209;
  static double? s215;
  static double? s218;
  static double? s221;
  static double? s222;
  static double? s220;
  static double? s210;
  static double? s230;
  static double? s240;
  static double? s244;
  static double? s250;
  static double? s260;
  static double? s265;
  static double? s270;
  static double? s280;
  static double? s300;
  static double? s310;
  static double? s320;
  static double? s334;
  static double? s340;
  static double? s350;
  static double? s380;
  static double? s400;
  static double? s500;
  static double? s520;
  static double? s530;
  static double? s550;
  static double? s580;
  static double? s600;
  static double? s620;
  static double? s860;
  static double? s880;
  static double? s900;
  static double? s920;
  static double? s930;
  static double? s940;
  static double? s950;
  static double? s960;
  static double? s980;
  static double? s1000;
  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    double safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - safeAreaWidth);
    safeHeight = (screenHeight - safeAreaHeight);

    //Scale factor for responsive UI
    scaleFactorHeight = (safeHeight! / 820);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }
    scaleFactorWidth = safeWidth! / 392;
    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }

    //Custom ss
    s0 = 0;
    s1 = scaleFactorHeight * 1;
    s2 = scaleFactorHeight * 2;
    s3 = scaleFactorHeight * 3;
    s4 = scaleFactorHeight * 4;
    s5 = scaleFactorHeight * 5;
    s6 = scaleFactorHeight * 6;
    s7 = scaleFactorHeight * 7;
    s8 = scaleFactorHeight * 8;
    s9 = scaleFactorHeight * 9;
    s10 = scaleFactorHeight * 10;
    s11 = scaleFactorHeight * 11;
    s12 = scaleFactorHeight * 12;
    s13 = scaleFactorHeight * 13;
    s14 = scaleFactorHeight * 14;
    s15 = scaleFactorHeight * 15;
    s16 = scaleFactorHeight * 16;
    s17 = scaleFactorHeight * 17;
    s18 = scaleFactorHeight * 18;
    s19 = scaleFactorHeight * 19;
    s20 = scaleFactorHeight * 20;
    s21 = scaleFactorHeight * 21;
    s22 = scaleFactorHeight * 22;
    s23 = scaleFactorHeight * 23;
    s24 = scaleFactorHeight * 24;
    s25 = scaleFactorHeight * 25;
    s26 = scaleFactorHeight * 26;
    s27 = scaleFactorHeight * 27;
    s28 = scaleFactorHeight * 28;
    s29 = scaleFactorHeight * 29;
    s30 = scaleFactorHeight * 30;
    s32 = scaleFactorHeight * 32;
    s34 = scaleFactorHeight * 34;
    s35 = scaleFactorHeight * 35;
    s36 = scaleFactorHeight * 36;
    s38 = scaleFactorHeight * 38;
    s40 = scaleFactorHeight * 40;
    s42 = scaleFactorHeight * 42;
    s44 = scaleFactorHeight * 44;
    s45 = scaleFactorHeight * 45;
    s48 = scaleFactorHeight * 48;
    s50 = scaleFactorHeight * 50;
    s52 = scaleFactorHeight * 52;
    s54 = scaleFactorHeight * 54;
    s56 = scaleFactorHeight * 56;
    s60 = scaleFactorHeight * 60;
    s64 = scaleFactorHeight * 64;
    s68 = scaleFactorHeight * 68;
    s70 = scaleFactorHeight * 70;
    s72 = scaleFactorHeight * 72;
    s76 = scaleFactorHeight * 76;
    s80 = scaleFactorHeight * 80;
    s84 = scaleFactorHeight * 84;
    s88 = scaleFactorHeight * 88;
    s90 = scaleFactorHeight * 90;
    s96 = scaleFactorHeight * 96;
    s100 = scaleFactorHeight * 100;
    s105 = scaleFactorHeight * 105;
    s106 = scaleFactorHeight * 106;
    s110 = scaleFactorHeight * 110;
    s115 = scaleFactorHeight * 115;
    s120 = scaleFactorHeight * 120;
    s124 = scaleFactorHeight * 124;
    s130 = scaleFactorHeight * 130;
    s135 = scaleFactorHeight * 135;
    s138 = scaleFactorHeight * 138;
    s140 = scaleFactorHeight * 140;
    s145 = scaleFactorHeight * 145;
    s150 = scaleFactorHeight * 150;
    s155 = scaleFactorHeight * 155;
    s160 = scaleFactorHeight * 160;
    s166 = scaleFactorHeight * 166;
    s170 = scaleFactorHeight * 170;
    s180 = scaleFactorHeight * 180;
    s190 = scaleFactorHeight * 190;
    s200 = scaleFactorHeight * 200;
    s205 = scaleFactorHeight * 205.3;
    s206 = scaleFactorHeight * 206;
    s207 = scaleFactorHeight * 207;
    s208 = scaleFactorHeight * 208;
    s209 = scaleFactorHeight * 209;
    s210 = scaleFactorHeight * 210;
    s215 = scaleFactorHeight * 215.3;
    s218 = scaleFactorHeight * 218;
    s220 = scaleFactorHeight * 220;
    s221 = scaleFactorHeight * 221.3;
    s222 = scaleFactorHeight * 222;
    s230 = scaleFactorHeight * 230;
    s240 = scaleFactorHeight * 240;
    s244 = scaleFactorHeight * 244;
    s250 = scaleFactorHeight * 250;
    s260 = scaleFactorHeight * 260;
    s265 = scaleFactorHeight * 265;
    s270 = scaleFactorHeight * 270;
    s280 = scaleFactorHeight * 280;
    s300 = scaleFactorHeight * 300;
    s310 = scaleFactorHeight * 310;
    s320 = scaleFactorHeight * 320;
    s334 = scaleFactorHeight * 334;
    s340 = scaleFactorHeight * 340;
    s350 = scaleFactorHeight * 350;
    s380 = scaleFactorHeight * 380;
    s400 = scaleFactorHeight * 400;
    s500 = scaleFactorHeight * 500;
    s520 = scaleFactorHeight * 520;
    s530 = scaleFactorHeight * 530;
    s550 = scaleFactorHeight * 550;
    s580 = scaleFactorHeight * 580;
    s600 = scaleFactorHeight * 600;
    s620 = scaleFactorHeight * 620;
    s860 = scaleFactorHeight * 860;
    s880 = scaleFactorHeight * 880;
    s900 = scaleFactorHeight * 900;
    s920 = scaleFactorHeight * 920;
    s930 = scaleFactorHeight * 930;
    s940 = scaleFactorHeight * 940;
    s950 = scaleFactorHeight * 950;
    s960 = scaleFactorHeight * 960;
    s980 = scaleFactorHeight * 980;
    s1000 = scaleFactorHeight * 1000;
  }

  static double getScaledsWidth(double s) {
    return (s * scaleFactorWidth);
  }

  static double getScaledsHeight(double s) {
    return (s * scaleFactorHeight);
  }
}
