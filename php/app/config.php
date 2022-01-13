<?php

$config = json_decode(file_get_contents(APP . '/data/config.json'));

$config->url = str_replace('index.php', '', $_SERVER['SCRIPT_NAME']);
