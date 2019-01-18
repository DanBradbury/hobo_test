// hobo_dll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include <windows.h>

#define fn_export extern "C" __declspec (dllexport)

extern "C" __declspec (dllexport) double __cdecl simulate_click()
{
	HWND hWnd = GetForegroundWindow();
	PostMessage(hWnd, WM_LBUTTONUP, MK_LBUTTON, NULL);
	PostMessage(hWnd, WM_LBUTTONDOWN, MK_LBUTTON, NULL);

	return 0;
}
