import 'package:flutter/material.dart';
import 'package:social_app/style/icon_broken.dart';

class ItemsBottomNav {
  static const List<BottomNavigationBarItem> _itemsBottomNav = [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Chat,
      ),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Plus,
      ),
      label: 'Post',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Location,
      ),
      label: 'Users',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Setting,
      ),
      label: 'Setting',
    ),
  ];

  static List<BottomNavigationBarItem> get itemsBottomNav => _itemsBottomNav;
}
