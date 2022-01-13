<?php

class DTable
{
	private $_autoindex = false;
	private $_name = false;
	private $_code = [];
	private $_head = false;
	private $_body = [];

	private function cc()
	{
		$this->_code = [];
	}

	public function name($name)
	{
		$this->_name = $name;
	}

	public function autoIndex($id)
	{
		$this->_autoindex = $id;
	}

	public function head($data = array())
	{
		$this->cc();
		foreach ($data as $key => $td)
			$this->_code[] = (is_array($td) ? "<th width='" . $td[1] . "%'>" . $td[0] . "</th>" : "<th>" . $td . "</th>");
		$this->_head = $this->tr(1);
	}

	public function line($data = array())
	{
		$this->cc();
		$index = 1;
		foreach ($data as $key => $td) {
			if ($this->_autoindex && $this->_autoindex == $index) {
				$this->_code[] = "<td class='index'>" . count($this->_body) + 1 . "</td>";
			}
			if (is_array($td)) {
				if (is_array($td[0])) {
					$this->_code[] = "<td data-" . $td[0][0] . "='" . $td[0][1] . "'>" . $td[1] . "</td>";
				} else {
					$this->_code[] = "<td data-" . $td[0] . ">" . $td[1] . "</td>";
				}
			} else {
				$this->_code[] = "<td>" . $td . "</td>";
			}
			$index++;
		}

		$this->_body[] = $this->tr();
	}

	private function tr($isHead = false)
	{
		$this->_code = implode('', $this->_code);
		return ($isHead ? '<tr class="head">' . $this->_code . '</tr>' : '<tr>' . $this->_code . '</tr>');
	}

	private function clear($head = false)
	{
		if ($head) $this->_head = [];
		$this->_body = [];
	}

	public function end($clearHead = false)
	{
		$this->cc();
		if ($this->_name)
			$this->_code[] = "<caption>" . $this->_name . "</caption>";

		if ($this->_head)
			$this->_code[] = "<thead>" . $this->_head . "</thead>";

		$this->_code[] = "<tbody>" . implode('', $this->_body) . "</tbody>";

		$this->clear($clearHead);
		return "<table class='DTable'>" . implode('', $this->_code) . "</table>";
	}
}
