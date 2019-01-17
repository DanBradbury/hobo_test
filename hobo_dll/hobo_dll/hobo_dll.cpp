// hobo_dll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include <windows.h>

#define fn_export extern "C" __declspec (dllexport)

extern "C" __declspec (dllexport) double __cdecl simulate_click()
{
	HWND hWnd = GetForegroundWindow();
	SendMessage(hWnd, WM_LBUTTONDOWN, 0, NULL);
	return 0;
}
