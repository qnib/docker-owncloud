<?php
$CONFIG = array(
  'datadirectory' => '/data/owncloud/',
  'apps_path' => array (
    0 => array (
      "path" => OC::$SERVERROOT."/apps",
      "url" => "/apps",
      "writable" => false,
    ),
  ),
  'version' => '8.1.5',
  'dbname' => 'owncloud',
  'dbhost' => 'localhost',
  'dbuser' => 'owncloud',
  'installed' => false,
  'loglevel' => '0',
);
?>
