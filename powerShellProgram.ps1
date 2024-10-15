# 使用者にディレクトリパスを入力してもらう
$directory = Read-Host "ファイル名を置換する対象のディレクトリのパスを入力してください"

# 使用者に置換前と置換後の文字列を入力してもらう
$oldText = Read-Host "置換したい文字列を入力してください"
$newText = Read-Host "新しい文字列を入力してください"

# ディレクトリ内のファイルを取得し、ファイル名を置換
Get-ChildItem -Path $directory -File | ForEach-Object {
    $oldName = $_.Name
    $newName = $oldName -replace [regex]::Escape($oldText), $newText
    if ($oldName -ne $newName) {
        Rename-Item -Path $_.FullName -NewName $newName
        Write-Host "ファイル名を変更しました: '$oldName' → '$newName'"
    }
}