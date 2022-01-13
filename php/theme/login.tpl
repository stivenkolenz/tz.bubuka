<section class="Login">
	[{ NOT-LOGGED }]
	<h2 class="Login__title">Авторизация</h2>
	<form method="POST" class="flex flex--fdc flex--aic flex--jcc Login__form">
		<input type="text" name='login' placeholder="Ваш логин" required>
		<input type="password" name='password' placeholder="Ваш пароль" required>
		<button name='auth'>Войти</button>
	</form>
	[{ /NOT-LOGGED }]
	[{ LOGGED }]
	<div class="Login__auth">
		Привет, <b>[{ USERNAME }]</b>. Вы авторизированы.
		<br>
		<a href="?logout" class="Login__link">Выйти</a>
	</div>
	[{ /LOGGED }]
</section>