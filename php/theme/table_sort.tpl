<section class="SortTable">
	<h2 class="SortTable__title">Сортировка данных</h2>
	<form method="POST" class="SortTable__form flex">
		<select name="field" required>
			<option value="">Выберите поле</option>
			<option value="city_name">Город</option>
			<option value="country_name">Страна</option>
			<option value="count">Население</option>
		</select>
		<select name="type">
			<option value="">Выберите порядок</option>
			<option value="ASC">По возрастанию</option>
			<option value="DESC">По убыванию</option>
		</select>
		<button name="sort">Сортировать</button>
		<a href="?">Сбросить</a>
	</form>
</section>