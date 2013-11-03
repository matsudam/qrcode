<?php
/**
 * 「QRコード生成」
 */
require_once("Image/QRCode.php"); 
/*
$qr = new Image_QRCode(); 
$option = array(
	"module_size"=>2,     //サイズ=>1〜19で指定
	"image_type"=>"jpeg",   //画像形式=>jpegかpngを指定
	"output_type"=>"display",  //出力方法=>displayかreturnで指定 returnの場合makeCodeで画像リソースが返される
	"error_correct"=>"H"     //クオリティ(L<M<Q<H)を指定
);
$qr->makeCode("Hello, world",$option); 
*/

try{ 
	include_once ('./src/initialization.php');
	include_once ('Image/QRCode.php');

	$text = htmlspecialchars($param["text"]);
	$size = (int)$param["size"];
	$type = $param["type"];
	$quality = $param["quality"];

	$qr = new Image_QRCode(); 
	$option = array(
		"module_size"=>$size,     //サイズ=>1〜19で指定
		"image_type"=>$type,   //画像形式=>jpegかpngを指定
		"output_type"=>"display",  //出力方法=>displayかreturnで指定 returnの場合makeCodeで画像リソースが返される
		"error_correct"=>$quality     //クオリティ(L<M<Q<H)を指定
	);

	$qr->makeCode($text, $option); 

		
} catch (Exception $e){ 
	echo "エラー発生:" . $e->getMessage();
	exit();
}

?>
