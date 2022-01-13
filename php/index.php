<?php

define('ROOT', __DIR__);
define('APP', ROOT . '/app');

@error_reporting(E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE);
@ini_set('error_reporting', E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE);

@ini_set('display_errors', true);
@ini_set('html_errors', false);

session_start();
