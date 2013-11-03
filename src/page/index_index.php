<?php
	$qr = $param["qr"];
	$text = $param["text"];
	$size = $param["size"];
	$type = $param["type"];
	$quality = $param["quality"];

	if($qr==1 && !$text){
		$msg = "QRコード化するテキストを入力してください。";
		$qr = 0;
	}

	if($qr==1 && !$size){
		$msg = "サイズを指定してください。";
		$qr = 0;
	}

	if($qr==1 && !$type){
		$msg = "画像タイプを指定してください。";
		$qr = 0;
	}

	if($qr==1 && !$quality){
		$msg = "品質を指定してください。";
		$qr = 0;
	}


	$smarty->assign('qr', $qr);
	$smarty->assign('text', $text);
	$smarty->assign('size', $size);
	$smarty->assign('type', $type);
	$smarty->assign('quality', $quality);
	$smarty->assign('msg', $msg);
?>
