<?php

class Functions
{

	static public function pre($var, $dump = false)
	{
		echo "<pre>";
		if ($dump) var_dump($var);
		else print_r($var);
		echo "</pre>";
	}

	static public function getIP()
	{
		if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		} else {
			$ip = $_SERVER['REMOTE_ADDR'];
		}
		return $ip;
	}

	public function preb($var, $dump = false)
	{
		ob_start();
		$this->pre($var, $dump);
		return ob_get_clean();
	}

	public function recursiveAddslashes($obj)
	{
		if (is_array($obj) || is_object($obj)) {
			foreach ($obj as $key => $value) {
				if (is_array($value) || is_object($value)) {
					$obj[$key] = $this->recursiveAddslashes((array)$value);
				} else {
					$obj[$key] = addslashes($value);
				}
			}
		} else {
			$obj = addslashes($obj);
		}
		return $obj;
	}

	public function prec($var, $title = false)
	{
		$title = ($title ? addslashes($title) : $title);
		echo ("<script>console.log( " . ($title ? "'{$title}', " : '') . "JSON.parse( '" . json_encode($this->recursiveAddslashes($var)) . "') );</script>");
	}

	public function cookie($name, $value, $expires, $path = '/')
	{
		if ($expires) $expires = time() + ($expires * 86400);
		else $expires = time() - 3600;
		setcookie($name, $value, $expires, $path, $_SERVER['HTTP_HOST']);
	}

	public function getInfoBrowser()
	{
		$agent = $_SERVER['HTTP_USER_AGENT'];
		preg_match("/(MSIE|Opera|Firefox|Chrome|Version)(?:\/| )([0-9.]+)/", $agent, $bInfo);
		$browserInfo = array();
		$browserInfo['name'] = ($bInfo[1] == "Version") ? "Safari" : $bInfo[1];
		$browserInfo['version'] = $bInfo[2];
		return $browserInfo;
	}

	public function loc($url, $msg = false, $code = false)
	{
		if ($msg) {
			global $SMSG;
			$SMSG->add($msg);
		}
		if ($code) http_response_code($code);
		header("Location: {$url}");
		die();
	}

	public function file_force_download($file)
	{
		if (file_exists($file)) {
			// сбрасываем буфер вывода PHP, чтобы избежать переполнения памяти выделенной под скрипт
			// если этого не сделать файл будет читаться в память полностью!
			if (ob_get_level()) {
				ob_end_clean();
			}
			// заставляем браузер показать окно сохранения файла
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Disposition: attachment; filename=' . basename($file));
			header('Content-Transfer-Encoding: binary');
			header('Expires: 0');
			header('Cache-Control: must-revalidate');
			header('Pragma: public');
			header('Content-Length: ' . filesize($file));
			// читаем файл и отправляем его пользователю
			readfile($file);
			exit;
		}
	}

	public function reindexData($data, $mainKey = 'id')
	{
		$arr = [];
		foreach ($data as $key => $value)
			$arr[$value[$mainKey]] = $value;
		return $arr;
	}
}
