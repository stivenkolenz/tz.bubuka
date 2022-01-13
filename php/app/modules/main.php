<?php

require_once req('table');

$TPL->name('table_sort');
$C->add($TPL->compile('table_sort'), 'main');
$sort = ['`continent_name` ASC'];

if (isset($_POST['sort'])) {
	$sort[] = "`" . $DB->es($_POST['field']) . "` " . $DB->es($_POST['type']);
}

$sort = implode(', ', $sort);

$SQL = "SELECT *, (SELECT `name` FROM `cities` WHERE `city` = `cities`.`id`) AS `city_name`, (SELECT `country` FROM `cities` WHERE `city` = `cities`.`id`) AS `city_country`, (SELECT `name` FROM `countries` WHERE `city_country` = `countries`.`id`) AS `country_name`, (SELECT `continent` FROM `countries` WHERE `city_country` = `countries`.`id`) AS `country_continent`, (SELECT `name` FROM `continents` WHERE `country_continent` = `continents`.`id`) AS `continent_name` FROM `population` ORDER BY {$sort};";

$res = $DB->qf_array($SQL, 1);

$tables = [];
$last = $res[0]['continent_name'];

$T = new DTable;
$T->name($last);
$T->head([['М'], ['Город / Агломерация'], ['Страна'], ['Население агломирации (т.ч.)']]);
$T->autoIndex(1);

foreach ($DB->rD() as $key => $value) {
	if ($last != $value['continent_name']) {
		$tables[$last] = $T->end();
		$T->name($value['continent_name']);
	}
	$T->line([
		$value['city_name'],
		$value['country_name'],
		$value['count'],
	]);
	$last = $value['continent_name'];
}
$tables[$last] = $T->end();

$C->add(implode('', $tables), 'main');
