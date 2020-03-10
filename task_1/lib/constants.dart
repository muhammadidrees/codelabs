import 'package:flutter/material.dart';

enum ComplaintStatus{
  pending, 
  wroking, 
  resolved,
}

Color pending_status_color = Color(0xFFF1592A);
Color working_status_color = Color(0xFFFCB040);
Color resolved_status_color = Color(0xFF3AB54B);

const size_xs = 4.0;
const size_s = 8.0;
const size_l = 16.0;
const size_xl = 32.0;

const app_icon_size = 20.0;