; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "R-circuits"
!define PRODUCT_VERSION "0.4.1"
!define PRODUCT_PUBLISHER "Pozsar Zsolt"
!define PRODUCT_WEB_SITE "http:\\www.pozsarzs.hu"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\r-circuits.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Uninstaller pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "$(MUILicense)" 
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_RUN "$INSTDIR\r-circuits.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\documents\readme.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Hungarian"

; License Language
LicenseLangString MUILicense ${LANG_ENGLISH} "r-circuits\documents\copying.txt"
LicenseLangString MUILicense ${LANG_HUNGARIAN} "r-circuits\documents\copying.txt"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "r-circuits-0.4.1-win32.exe"
InstallDir "$PROGRAMFILES\R-circuits"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "Main files" SEC01
  SetOutPath "$INSTDIR\documents"
  SetOverwrite try
  File "r-circuits\documents\authors.txt"
  File "r-circuits\documents\changelog.txt"
  File "r-circuits\documents\copying.txt"
  File "r-circuits\documents\install.txt"
  File "r-circuits\documents\readme.txt"
  File "r-circuits\documents\version.txt"
  SetOutPath "$INSTDIR\documents\hu"
  File "r-circuits\documents\hu\copying.txt"
  File "r-circuits\documents\hu\install.txt"
  File "r-circuits\documents\hu\readme.txt"
  SetOutPath "$INSTDIR\figures"
  File "r-circuits\figures\module_01.png"
  File "r-circuits\figures\module_02.png"
  File "r-circuits\figures\module_03.png"
  File "r-circuits\figures\module_04.png"
  File "r-circuits\figures\module_05.png"
  File "r-circuits\figures\module_06.png"
  File "r-circuits\figures\module_07.png"
  File "r-circuits\figures\module_08.png"
  File "r-circuits\figures\module_09.png"
  File "r-circuits\figures\module_10.png"
  File "r-circuits\figures\module_11.png"
  File "r-circuits\figures\module_12.png"
  File "r-circuits\figures\module_13.png"
  File "r-circuits\figures\module_14.png"
  File "r-circuits\figures\module_15.png"
  File "r-circuits\figures\module_16.png"
  File "r-circuits\figures\module_17.png"
  File "r-circuits\figures\module_18.png"
  File "r-circuits\figures\module_19.png"
  File "r-circuits\figures\module_20.png"
  SetOutPath "$INSTDIR\help"
  File "r-circuits\help\styles.css"
  File "r-circuits\help\en.html"
  File "r-circuits\help\en_cmdparams.html"
  File "r-circuits\help\en_hotkeys.html"
  File "r-circuits\help\en_intro.html"
  File "r-circuits\help\hu.html"
  File "r-circuits\help\hu_cmdparams.html"
  File "r-circuits\help\hu_hotkeys.html"
  File "r-circuits\help\hu_intro.html"
  SetOutPath "$INSTDIR"
  File "r-circuits\r-circuits.exe"
  File "r-circuits\readme.txt"
  CreateShortCut "$DESKTOP\R-circuits.lnk" "$INSTDIR\r-circuits.exe"
  CreateDirectory "$SMPROGRAMS\R-circuits"
  CreateShortCut "$SMPROGRAMS\R-circuits\R-circuits.lnk" "$INSTDIR\r-circuits.exe"
SectionEnd

Section "Translate HU" SEC02
  SetOutPath "$INSTDIR\languages\hu"
  File "r-circuits\languages\hu\r-circuits.mo"
  File "r-circuits\languages\hu\r-circuits.po"
  SetOutPath "$INSTDIR\languages"
  File "r-circuits\languages\r-circuits.pot"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  CreateDirectory "$SMPROGRAMS\R-circuits"
  CreateShortCut "$SMPROGRAMS\R-circuits\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\r-circuits.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\r-circuits.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
  LangString DESC_Section1 ${LANG_ENGLISH} "Required files"
  LangString DESC_Section2 ${LANG_ENGLISH} "Hungarian translate"
  LangString DESC_Section1 ${LANG_HUNGARIAN} "Kötelező állományok"
  LangString DESC_Section2 ${LANG_HUNGARIAN} "Magyar fordítás"
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} $(DESC_Section1)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} $(DESC_Section2)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

; Section uninstall
  Function un.onInit
  !insertmacro MUI_UNGETLANGUAGE
  FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\readme.txt"
  Delete "$INSTDIR\r-circuits.exe"
  Delete "$INSTDIR\help\styles.css"
  Delete "$INSTDIR\help\en.html"
  Delete "$INSTDIR\help\en_cmdparams.html"
  Delete "$INSTDIR\help\en_hotkeys.html"
  Delete "$INSTDIR\help\en_intro.html"
  Delete "$INSTDIR\help\hu.html"
  Delete "$INSTDIR\help\hu_cmdparams.html"
  Delete "$INSTDIR\help\hu_hotkeys.html"
  Delete "$INSTDIR\help\hu_intro.html"
  Delete "$INSTDIR\figures\module_01.png"
  Delete "$INSTDIR\figures\module_02.png"
  Delete "$INSTDIR\figures\module_03.png"
  Delete "$INSTDIR\figures\module_04.png"
  Delete "$INSTDIR\figures\module_05.png"
  Delete "$INSTDIR\figures\module_06.png"
  Delete "$INSTDIR\figures\module_07.png"
  Delete "$INSTDIR\figures\module_08.png"
  Delete "$INSTDIR\figures\module_09.png"
  Delete "$INSTDIR\figures\module_10.png"
  Delete "$INSTDIR\figures\module_11.png"
  Delete "$INSTDIR\figures\module_12.png"
  Delete "$INSTDIR\figures\module_13.png"
  Delete "$INSTDIR\figures\module_14.png"
  Delete "$INSTDIR\figures\module_15.png"
  Delete "$INSTDIR\figures\module_16.png"
  Delete "$INSTDIR\figures\module_17.png"
  Delete "$INSTDIR\figures\module_18.png"
  Delete "$INSTDIR\figures\module_19.png"
  Delete "$INSTDIR\figures\module_20.png"
  Delete "$INSTDIR\languages\r-circuits.pot"
  Delete "$INSTDIR\languages\hu\r-circuits.po"
  Delete "$INSTDIR\languages\hu\r-circuits.mo"
  Delete "$INSTDIR\documents\authors.txt"
  Delete "$INSTDIR\documents\changelog.txt"
  Delete "$INSTDIR\documents\copying.txt"
  Delete "$INSTDIR\documents\install.txt"
  Delete "$INSTDIR\documents\readme.txt"
  Delete "$INSTDIR\documents\version.txt"
  Delete "$INSTDIR\documents\hu\install.txt"
  Delete "$INSTDIR\documents\hu\readme.txt"
  Delete "$INSTDIR\documents\hu\copying.txt"

  Delete "$SMPROGRAMS\R-circuits\Uninstall.lnk"
  Delete "$DESKTOP\R-circuits.lnk"
  Delete "$SMPROGRAMS\R-circuits\R-circuits.lnk"

  RMDir "$SMPROGRAMS\R-circuits"
  RMDir "$INSTDIR\help"
  RMDir "$INSTDIR\figures"
  RMDir "$INSTDIR\languages\hu"
  RMDir "$INSTDIR\languages"
  RMDir "$INSTDIR\documents\hu"
  RMDir "$INSTDIR\documents"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
