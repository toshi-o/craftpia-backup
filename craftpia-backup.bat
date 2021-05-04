@echo off
REM craftpia-backup.bat
REM (C) toshi-o
REM Craftpiaのセーブデータをバックアップするだけのスクリプト
REM 2021 05 04 作成　

chcp 65001
cd /d %~dp0

:: OneDriveにとる場合
set DST=%ONEDRIVE%\Craftpia-saves
:: ほかのとこにとる場合の例。
:: GoogleDrive使ってもっとスマートにしたいならsticka使うようにしてもいいかも。
set DST=D:\GoogleDrive\Craftpia\saves


:: コピー元。変更してなければこのままでOK
set SRC=%USERPROFILE%\AppData\LocalLow\PocketPair\Craftopia\Save

:: ファイル名用日付・時刻生成
set TM=%time: =0%
set DT=%date:~0,4%%date:~5,2%%date:~8,2%
set DTTM=%DT:~0,4%%DT:~5,2%%DT:~8,2%-%TM:~0,2%%TM:~3,2%%TM:~6,2%


:: コピー先フォルダ
set DSTDIR=%DST%\%DTTM%

:: XCOPYのオプション
set XCOPYOPT= /I /E /H /C /F

:: コピー先フォルダ
mkdir %DSTDIR%

xcopy %SRC% %DSTDIR% %XCOPYOPT%
