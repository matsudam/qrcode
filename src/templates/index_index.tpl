<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="{$css_url}style.css" type="text/css" />
	<script type="text/javascript" src="{$js_url}jquery-2.0.3.min.js"></script>

	<title>{$service_name}</title>

{literal}
<script type="text/javascript">
$(function () {
var supportsInputAttribute = function (attr) {
var input = document.createElement('input');
return attr in input;
};
if (!supportsInputAttribute('placeholder')) {
$('[placeholder]').each(function () {
var
input = $(this),
placeholderText = input.attr('placeholder'),
placeholderColor = 'GrayText',
defaultColor = input.css('color');
input.
focus(function () {
if (input.val() === placeholderText) {
input.val('').css('color', defaultColor);
}
}).
blur(function () {
if (input.val() === '') {
input.val(placeholderText).css('color', placeholderColor);
} else if (input.val() === placeholderText) {
input.css('color', placeholderColor);
}
}).
blur().
parents('form').
submit(function () {
if (input.val() === placeholderText) {
input.val('');
}
});
});
}
});
</script>
{/literal}

	<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
	</script>
	<![endif]-->
</head>
<body>

<!-- GoogleAnalytics-Start -->
{literal}
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-28045860-2', 'hanak.in');
  ga('send', 'pageview');
</script>
{/literal}
<!-- GoogleAnalytics-end -->

<header id="header">
	<a href="./"><img src="{$img_url}logo.png" /></a>
</header>
<div id="main">

	<form action="/qrcode/?" method="get">
		<input type="hidden" name="qr" value="1">
		<p>
			<input type="text" name="text" id="text" size="30" value="{$text}" maxlength="256" placeholder="テキストを入力してね♪">
		</p>
		<p>
			サイズ：<select name="size">
				<option value="1" {if $size==1}selected{/if}>極小</option>
				<option value="3" {if $size==3}selected{/if}>小</option>
				<option value="6" {if $size==6 || !$size}selected{/if}>中</option>
				<option value="10" {if $size==10}selected{/if}>大</option>
				<option value="19" {if $size==19}selected{/if}>極大</option>
			</select>
		</p>
		<p>
			画像タイプ：<input type="radio" name="type" value="png" {if $type=="png" || !$type}checked="checked"{/if}>png
				<input type="radio" name="type" value="jpeg" {if $type=="jpeg"}checked="checked"{/if}>jpeg
		</p>
		<p>
			品質：<select name="quality">
				<option value="H" {if $quality=="H"}selected{/if}>最高</option>
				<option value="Q" {if $quality=="Q" || !$quality}selected{/if}>高</option>
				<option value="M" {if $quality=="M"}selected{/if}>中</option>
				<option value="L" {if $quality=="L"}selected{/if}>低</option>
			</select>
		</p>
		<p>
			<input type="submit" id="submit" value="QRコード生成" />
		</p>
	</form>

	{if $msg}
	<p id="msg">
		<span id="msg">{$msg}</span>
	</p>
	{/if}

	{if $qr}
		<p>
			<img src="./qr.php?text={$text}&size={$size}&type={$type}&quality={$quality}" />
		</p>
	{/if}
</div>
<footer id="footer">
	Copyright (C) {$smarty.now|date_format:"%Y"} <a href="http://matsudam.com" target="_blank">matsudam</a> All Rights Reserved.
</footer><!-- #footer -->

</body>
</html>