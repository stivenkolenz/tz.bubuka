<?php

define('LOGGED', (isset($_COOKIE['auth_name']) && isset($_COOKIE['auth_pass']))); //* Простая проверка авторизации

if (LOGGED && isset($_GET['logout'])) {
	$F->cookie('auth_name', 0, -1);
	$F->cookie('auth_pass', 0, -1);
	$F->loc($config->url);
}

if (!LOGGED & isset($_POST['auth'])) {
	$F->cookie('auth_name', $_POST['login'], 31);
	$F->cookie('auth_pass', $_POST['password'], 31);
	$F->loc($config->url);
}

$TPL->name('login');
$TPL->set_block('LOGGED', LOGGED);
if (LOGGED) {
	$TPL->set('USERNAME', $_SESSION['auth_name']);
}
$TPL->set_block('NOT-LOGGED', !LOGGED);
$C->create('login', $TPL->compile());
