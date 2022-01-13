<?php

require_once req('config.php', '/app/');
require_once req('functions');
require_once req('content');
require_once req('theme');
require_once req('mysql');

$F = new Functions;
$C = new Content;
$TPL = new Theme($config->url);

$DB = new DB($config->DB->USER, $config->DB->PASSWORD, $config->DB->NAME);

$C->create('main', false);
require_once req('login.php', '/app/modules/');

if (LOGGED) {
	require_once req('main.php', '/app/modules/');
}

$TPL->name('main');
$TPL->set('TITLE', $config->title);
$TPL->set('LOGIN', $C->get('login'));
$TPL->set('CONTENT', $C->get('main'));
echo $TPL->compile();
