; PVZ_Weihua 安装程序

#define MyAppName "植物大战僵尸威化版 PVZ_Weihua"
#define MyAppVerNum ""
#define MyAppVerFull ""
#define AppVerName "威化版 v" + MyAppVerNum
#define MyAppExeName "PlantsVsZombies.exe"
#define MyaccName "PVZ_Weihua_威化版"
#define CCT GetDateTimeString('yyyymmdd', '', '')
;CCT: Compilation completion time

[Setup]
; 唯一 AppId，请勿在其他安装包中复用
AppId={{E984518B-0EBC-4CE2-813A-168FB2D331FE}
; 设定"应用程序名称"
AppName={#MyAppName}
; 设定"应用程序版本号"
AppVersion={#MyAppVerNum}
; 设定"带版本号的完整产品名称"
AppVerName={#AppVerName}
; 写入最终 setup.exe 的 Windows 版本号
VersionInfoVersion={#MyAppVerFull}
;资源管理器"详细信息"页的完整产品名称
VersionInfoDescription={#AppVerName}
; 悬停时''公司''显示
VersionInfoCompany=WeiHua
; 资源管理器"详细信息"页的产品名称
VersionInfoProductName={#MyAppName}
; 资源管理器"详细信息"页的版权信息
VersionInfoCopyright=Copyright © 2023-2025 WeiHua
; 指定安装向导里默认的目标文件夹路径
DefaultDirName=C:\Program Files\PVZ_WeiHua
; "添加/删除程序"或"应用和功能"列表卸载条目显示图标
UninstallDisplayIcon={app}\{#MyAppExeName}
; 设定开始菜单里默认的程序组文件夹名称
DefaultGroupName=PVZ_Weihua {#MyAppVerNum}

; 许可文本:
LicenseFile=..\src\IPT\LF.txt
; 安装前文本:
InfoBeforeFile=..\Setup\ipt\IBF-{#MyAppVerNum}.txt
; 安装后文本:
InfoAfterFile=..\Setup\ipt\IAF-{#MyAppVerNum}.txt

; 移除以下行以在管理安装模式下运行 (为所有用户安装)。
; PrivilegesRequired=lowest

; 打包位置:
OutputDir=..\Output
; 打包名称:
OutputBaseFilename=PVZ_Weihua {#MyAppVerNum} {#CCT} 安装程序
; 打包图标:
SetupIconFile=..\PVZ_Weihua\{#MyAppVerNum}\Ico\weihua {#MyAppVerNum}.ico

; 开启"固实压缩"[SolidCompression]
SolidCompression=yes
; 界面选择"现代化"
WizardStyle=modern

[languages]
Name: "chinesesimplified"; MessagesFile: "..\Setup\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\PVZ_Weihua\{#MyAppVerNum}\PVZ_Weihua\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PVZ_Weihua\{#MyAppVerNum}\PVZ_Weihua\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意：不要在任何共享系统文件上使用 "Flags: ignoreversion" 

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {group}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}
Name: {autodesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}; Flags: nowait postinstall skipifsilent
