import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeIconsMapper {
  static Map<String, IconData> mapping = {
    'add': FontAwesomeIcons.plus,
    'store': FontAwesomeIcons.store,
    'faucet': FontAwesomeIcons.faucet,
    'building': FontAwesomeIcons.building,
    'receipt': FontAwesomeIcons.receipt,
    'sack-dollar': FontAwesomeIcons.sackDollar,
    'burger': FontAwesomeIcons.burger,
    'cart-shopping': FontAwesomeIcons.cartShopping,
    'credit-card': FontAwesomeIcons.creditCard,
    'baby': FontAwesomeIcons.baby,
    'mobile': FontAwesomeIcons.mobile,
    'baby-carriage': FontAwesomeIcons.babyCarriage,
    'gas-pump': FontAwesomeIcons.gasPump,
    'car': FontAwesomeIcons.car,
    'coins': FontAwesomeIcons.coins,
    'car-side': FontAwesomeIcons.carSide,
    'hospital': FontAwesomeIcons.hospital,
    'computer': FontAwesomeIcons.computer,
    'heart': FontAwesomeIcons.heart,
  };

  static getIcon(String icon) {
    if ( !mapping.containsKey( icon ) ) {
      print(icon);
      return FontAwesomeIcons.question;
    };
    return mapping[icon];
  }
}