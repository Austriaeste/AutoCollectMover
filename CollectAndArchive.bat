@echo off
setlocal enabledelayedexpansion

:: パス設定
set "source_folder=C:\Users\austr\Downloads\収集ファイル"
set "base_target=C:\Users\austr\OneDrive\デスクトップ\収集データ"

:: 最初のCSVファイルのファイル名を取得
for %%F in ("%source_folder%\*.csv") do (
    set "filename=%%~nF"
    goto :extract_dates
)

echo エラー: CSVファイルが見つかりません。
pause
exit /b

:extract_dates
:: ファイル名の構成：YYYYMMDDHH_YYYYMMDDHH_XXX.csv
for /f "tokens=1,2 delims=_" %%A in ("!filename!") do (
    set "start=%%A"
    set "end=%%B"
)

:: 年の抽出
set "year=!start:~0,4!"

:: MMDDの抽出
set "start_mmdd=!start:~4,4!"
set "end_mmdd=!end:~4,4!"

:: 保存先のパス生成
set "period_folder=!year!-!start_mmdd!-!end_mmdd!"
set "target_folder=%base_target%\!year!年度\!period_folder!"

:: フォルダ作成
if not exist "!target_folder!" (
    mkdir "!target_folder!"
)

:: フォルダ名を自動で構築
set "renamed_folder=!start_mmdd!-!end_mmdd!_収集ファイル"

:: フォルダを移動（リネーム付きコピー）
xcopy "%source_folder%" "!target_folder!\!renamed_folder!" /E /I /Y

echo 完了：!target_folder!\!renamed_folder! に移動しました。
pause
exit /b
