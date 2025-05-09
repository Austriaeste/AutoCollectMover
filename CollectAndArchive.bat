@echo off
setlocal enabledelayedexpansion

:: �p�X�ݒ�
set "source_folder=C:\Users\austr\Downloads\���W�t�@�C��"
set "base_target=C:\Users\austr\OneDrive\�f�X�N�g�b�v\���W�f�[�^"

:: �ŏ���CSV�t�@�C���̃t�@�C�������擾
for %%F in ("%source_folder%\*.csv") do (
    set "filename=%%~nF"
    goto :extract_dates
)

echo �G���[: CSV�t�@�C����������܂���B
pause
exit /b

:extract_dates
:: �t�@�C�����̍\���FYYYYMMDDHH_YYYYMMDDHH_XXX.csv
for /f "tokens=1,2 delims=_" %%A in ("!filename!") do (
    set "start=%%A"
    set "end=%%B"
)

:: �N�̒��o
set "year=!start:~0,4!"

:: MMDD�̒��o
set "start_mmdd=!start:~4,4!"
set "end_mmdd=!end:~4,4!"

:: �ۑ���̃p�X����
set "period_folder=!year!-!start_mmdd!-!end_mmdd!"
set "target_folder=%base_target%\!year!�N�x\!period_folder!"

:: �t�H���_�쐬
if not exist "!target_folder!" (
    mkdir "!target_folder!"
)

:: �t�H���_���������ō\�z
set "renamed_folder=!start_mmdd!-!end_mmdd!_���W�t�@�C��"

:: �t�H���_���ړ��i���l�[���t���R�s�[�j
xcopy "%source_folder%" "!target_folder!\!renamed_folder!" /E /I /Y

echo �����F!target_folder!\!renamed_folder! �Ɉړ����܂����B
pause
exit /b
