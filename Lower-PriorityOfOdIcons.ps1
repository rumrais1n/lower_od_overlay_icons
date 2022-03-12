$ParentRegKeyPaths = @(
	"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers",
	"HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers"
)

#OneDriveに関するキーを$OdRegKeysに格納
$OdRegKeys = @()
foreach ($ParentRegKeyPath in $ParentRegKeyPaths) {
	$TempOdRegKeys = @()
	$TempOdRegKeys += Get-ChildItem $ParentRegKeyPath | Select-Object Name
	$OdRegKeys += $TempOdRegKeys.Name.Replace("HKEY_LOCAL_MACHINE", "HKLM:") | Select-String "OneDrive"
}

#対象のレジストリキーの名前をStringに変換
$OdRegKeys_String = @()
foreach($OdRegKey in $OdRegKeys) {
	$OdRegKeys_String += $OdRegKey.Line
}

# 親のパスを削除
Foreach ($ParentRegKeyPath in $ParentRegKeyPaths) {
	For($i = 0; $i -lt $OdRegKeys_String.Length; $i++) {
		$OdRegKeys_String[$i] = $OdRegKeys_String[$i].Replace($ParentRegKeyPath + "\", "")
	}
}

# レジストリキーの名前を変更
For($i = 0; $i -lt $OdRegKeys.Length; $i++) {
	Rename-Item -LiteralPath $OdRegKeys[$i].Line.ToString() -NewName $OdRegKeys_String[$i].Replace(" ","")
}