<?php 
ob_start("compress");
function compress($buffer) {
  $buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $buffer);
  $buffer = str_replace(array("\r\n", "\r", "\n", "\t", '  ', '    ', '    '), '', $buffer);
  return $buffer;
}
include('style.css');
include('quovolver.css');
include('buttons.css');
include('headers.css');
include('jquery.weekcalendar.css');
include('demo_table_jui.css');
include('jquery.cleditor.css');
include('jplayer.blue.monday.css');

header('Cache-Control: max-age=2592000, public');
header('Expires-Active: On');
header('Expires: Fri, 1 Jan 2500 01:01:01 GMT');
header('Pragma:');
header('Content-type: text/css; charset=utf-8');

ob_end_flush();
