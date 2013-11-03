<?php
/**
 * リダイレクト
 */
function redirect($url){
	header("HTTP/1.1 301 Moved Permanently");
	header("Location: " . $url);
}

/**
 * メッセージ取得
 */
function get_message($err, $language){
	global $db, $message1, $message2;
	if($err==0){
		$message1 = $message2 = NULL;
	}else{
		$sql = "select message1, message2 from messages A where msg_id=" . $err . " and language=" . $language;
		$result = $db->query($sql);
		$row = $db->fetch( $result );
		$message1 = $row['message1'];
		$message2 = $row['message2'];
	}
}

?>