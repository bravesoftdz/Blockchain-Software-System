@echo off
Rem ======================================================================== Rem
Rem PeopleRelay: build_lib.bat Version: 0.4.3.6                              Rem
Rem                                                                          Rem
Rem Copyright 2017-2018 Aleksei Ilin & Igor Ilin                             Rem
Rem                                                                          Rem
Rem Licensed under the Apache License, Version 2.0 (the "License");          Rem
Rem you may not use this file except in compliance with the License.         Rem
Rem You may obtain a copy of the License at                                  Rem
Rem                                                                          Rem
Rem     http://www.apache.org/licenses/LICENSE-2.0                           Rem
Rem                                                                          Rem
Rem Unless required by applicable law or agreed to in writing, software      Rem
Rem distributed under the License is distributed on an "AS IS" BASIS,        Rem
Rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. Rem
Rem See the License for the specific language governing permissions and      Rem
Rem limitations under the License.                                           Rem
Rem ======================================================================== Rem
@echo on

Rem cls

@echo off

set std=%cd%
set prm=.\build.conf
set bin=%~dp0..\lib_bin\
set tmp=%~dp0..\tmp\
set log=%~dp0..\tmp\lib_log.txt

cd %~dp0

if not exist %prm% goto :err
for /f "delims== tokens=1,2" %%G in (%prm%) do set %%G=%%H

if exist %log% del %log%

cd ..\..\lib_src

@echo on
%fpc_path%%fpc% -Mdelphi -Xs -O2 -FU%tmp% -o%bin%pr_udf.dll .\pr_udf.dpr > %log%
@echo off

start notepad.exe %log%

goto :end
:err
Rem cls
@echo on
@echo Could not find file "%prm%"
@echo -----------------------
@echo off
pause

:end
cd %std%
