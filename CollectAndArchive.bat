@echo off
setlocal enabledelayedexpansion

:: パス設定
set "source_folder=%USERPROFILE%\Downloads\収集ファイル"
set "temp_base=%USERPROFILE%\Downloads\収集一時格納"
set "final_target=%USERPROFILE%\OneDrive\デスクトップ\収集データ"

:: 一時格納フォルダ初期化
if exist "%temp_base%" rd /s /q "%temp_base%"
mkdir "%temp_base%"

:: CSVファイルをループ処理
for %%F in ("%source_folder%\*.csv") do (
    set "filename=%%~nxF"
    echo ファイル名: !filename!

    echo !filename! > tmp_filename.txt
    for /f "tokens=1,2 delims=_" %%A in (tmp_filename.txt) do (
        set "start=%%A"
        set "end=%%B"
    )
    del tmp_filename.txt

    set "year=!start:~0,4!"
    set "start_mmdd=!start:~4,4!"
    set "end_mmdd=!end:~4,4!"

    :: 期間フォルダの判定（中略せずフル記述）
    if !start_mmdd! geq 0101 if !start_mmdd! leq 0110 (
        set "period_folder=!year!-0101-0110"
    ) else if !start_mmdd! geq 0111 if !start_mmdd! leq 0120 (
        set "period_folder=!year!-0111-0120"
    ) else if !start_mmdd! geq 0121 if !start_mmdd! leq 0131 (
        set "period_folder=!year!-0121-0131"
    ) else if !start_mmdd! geq 0201 if !start_mmdd! leq 0210 (
        set "period_folder=!year!-0201-0210"
    ) else if !start_mmdd! geq 0211 if !start_mmdd! leq 0220 (
        set "period_folder=!year!-0211-0220"
    ) else if !start_mmdd! geq 0221 if !start_mmdd! leq 0229 (
        set "period_folder=!year!-0221-0228"
    ) else if !start_mmdd! geq 0301 if !start_mmdd! leq 0310 (
        set "period_folder=!year!-0301-0310"
    ) else if !start_mmdd! geq 0311 if !start_mmdd! leq 0320 (
        set "period_folder=!year!-0311-0320"
    ) else if !start_mmdd! geq 0321 if !start_mmdd! leq 0331 (
        set "period_folder=!year!-0321-0331"
    ) else if !start_mmdd! geq 0401 if !start_mmdd! leq 0410 (
        set "period_folder=!year!-0401-0410"
    ) else if !start_mmdd! geq 0411 if !start_mmdd! leq 0420 (
        set "period_folder=!year!-0411-0420"
    ) else if !start_mmdd! geq 0421 if !start_mmdd! leq 0430 (
        set "period_folder=!year!-0421-0430"
    ) else if !start_mmdd! geq 0501 if !start_mmdd! leq 0510 (
        set "period_folder=!year!-0501-0510"
    ) else if !start_mmdd! geq 0511 if !start_mmdd! leq 0520 (
        set "period_folder=!year!-0511-0520"
    ) else if !start_mmdd! geq 0521 if !start_mmdd! leq 0531 (
        set "period_folder=!year!-0521-0531"
    ) else if !start_mmdd! geq 0601 if !start_mmdd! leq 0610 (
        set "period_folder=!year!-0601-0610"
    ) else if !start_mmdd! geq 0611 if !start_mmdd! leq 0620 (
        set "period_folder=!year!-0611-0620"
    ) else if !start_mmdd! geq 0621 if !start_mmdd! leq 0630 (
        set "period_folder=!year!-0621-0630"
    ) else if !start_mmdd! geq 0701 if !start_mmdd! leq 0710 (
        set "period_folder=!year!-0701-0710"
    ) else if !start_mmdd! geq 0711 if !start_mmdd! leq 0720 (
        set "period_folder=!year!-0711-0720"
    ) else if !start_mmdd! geq 0721 if !start_mmdd! leq 0731 (
        set "period_folder=!year!-0721-0731"
    ) else if !start_mmdd! geq 0801 if !start_mmdd! leq 0810 (
        set "period_folder=!year!-0801-0810"
    ) else if !start_mmdd! geq 0811 if !start_mmdd! leq 0820 (
        set "period_folder=!year!-0811-0820"
    ) else if !start_mmdd! geq 0821 if !start_mmdd! leq 0831 (
        set "period_folder=!year!-0821-0831"
    ) else if !start_mmdd! geq 0901 if !start_mmdd! leq 0910 (
        set "period_folder=!year!-0901-0910"
    ) else if !start_mmdd! geq 0911 if !start_mmdd! leq 0920 (
        set "period_folder=!year!-0911-0920"
    ) else if !start_mmdd! geq 0921 if !start_mmdd! leq 0930 (
        set "period_folder=!year!-0921-0930"
    ) else if !start_mmdd! geq 1001 if !start_mmdd! leq 1010 (
        set "period_folder=!year!-1001-1010"
    ) else if !start_mmdd! geq 1011 if !start_mmdd! leq 1020 (
        set "period_folder=!year!-1011-1020"
    ) else if !start_mmdd! geq 1021 if !start_mmdd! leq 1031 (
        set "period_folder=!year!-1021-1031"
    ) else if !start_mmdd! geq 1101 if !start_mmdd! leq 1110 (
        set "period_folder=!year!-1101-1110"
    ) else if !start_mmdd! geq 1111 if !start_mmdd! leq 1120 (
        set "period_folder=!year!-1111-1120"
    ) else if !start_mmdd! geq 1121 if !start_mmdd! leq 1130 (
        set "period_folder=!year!-1121-1130"
    ) else if !start_mmdd! geq 1201 if !start_mmdd! leq 1210 (
        set "period_folder=!year!-1201-1210"
    ) else if !start_mmdd! geq 1211 if !start_mmdd! leq 1220 (
        set "period_folder=!year!-1211-1220"
    ) else if !start_mmdd! geq 1221 if !start_mmdd! leq 1231 (
        set "period_folder=!year!-1221-1231"
    ) else (
        echo エラー: 対応していない日付範囲です。!start_mmdd!
        pause
        exit /b
    )

    set "local_target=%temp_base%\!year!年度\!period_folder!"
    if not exist "!local_target!" mkdir "!local_target!"

    copy "%%F" "!local_target!\!filename!" /Y
    echo ローカル格納：!local_target!\!filename!
)

:: 最後にまとめてローカル→本番へコピー
echo ------------------------------------------------------------
echo 本番へ一括コピー中...
robocopy "%temp_base%" "%final_target%" /E /NFL /NDL /NP /NJH /NJS
echo コピー完了

:: 一時フォルダ削除
echo 一時フォルダを削除中: %temp_base%
rd /s /q "%temp_base%"
echo 削除完了

pause
exit /b
