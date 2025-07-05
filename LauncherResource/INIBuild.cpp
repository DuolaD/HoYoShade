/*
* Copyright (C) 2025 DuolaD
* SPDX-License-Identifier: BSD-3-Clause
*/

#include <iostream>  
#include <fstream>  
#include <string>  
#include <cstdlib>   
#ifdef _WIN32  
    #include <windows.h>  
#else  
    #include <limits.h>  
    #include <unistd.h>  
#endif  
  
std::string get_selfpath() {  
    char buff[FILENAME_MAX];  
    #ifdef _WIN32  
        GetModuleFileName(NULL, buff, FILENAME_MAX);  
    #else  
        ssize_t len = ::readlink("/proc/self/exe", buff, sizeof(buff)-1);  
        if (len != -1) {  
          buff[len] = '\0';  
        }  
    #endif  
    std::string::size_type pos = std::string(buff).find_last_of("\\/");  
    return std::string(buff).substr(0, pos);  
}  
  
int main() {  
    std::string a = get_selfpath(); 

    a = a.substr(0, a.find_last_of("\\/")); 
    std::string filepath = a + "/ReShade.ini"; 
    std::ofstream outfile(filepath); 
    
    outfile<<"[ADDON]"<< std::endl;
    outfile<<"AddonPath="<< a <<"\\reshade-shaders\\Addons"<< std::endl;
    outfile<<"DisabledAddons=AutoHDR@AutoHDR.addon64,Swap chain override@swapchain_override.addon64,srReshade_v1.0.0@srReshade_v1.0.0.addon64,Shader Toggler@ShaderToggler.addon64,Reshade Effect Shader Toggler@ReshadeEffectShaderToggler.addon64,UIBind@ReShade64-UIBind-By-seri14.addon64,Editor History@ReShade64-EditorHistory-By-seri14.addon64,AutoReload@ReShade64-AutoReload-By-seri14.addon64,Adjust Depth@ReShade64-AdjustDepth-By-seri14.addon64,OBS Capture@obs_capture.addon64,LiveSplit Overlay@livesplit_overlay_x64.addon64,FreePIE@freepie.addon64,Frame Capture@frame_capture.addon64,IGCS Connector@IgcsConnector.addon64,Screenshot@ReShade64-Screenshot-By-seri14.addon64,LiveSplit Overlay@livesplit_overlay.addon64"<< std::endl;
	outfile << "AddonPath=" << a << "\\reshade-shaders\\Addons" << std::endl;
    outfile<<""<< std::endl;
	outfile<<"[DEPTH]"<< std::endl;
	outfile<<"DepthCopyAtClearIndex=0"<< std::endl;
	outfile<<"DepthCopyBeforeClears=0"<< std::endl;
	outfile<<"UseAspectRatioHeuristics=1"<< std::endl;
	outfile<<"OverlayCollapsed="<< std::endl;
	outfile<<"[GENERAL]"<< std::endl;
	outfile<<"EffectSearchPaths="<< a <<"\\reshade-shaders\\Shaders\\**"<< std::endl;
	outfile<<"PerformanceMode=0"<< std::endl;
	outfile<<"PreprocessorDefinitions=RESHADE_DEPTH_LINEARIZATION_FAR_PLANE=1000.0,RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN=1,RESHADE_DEPTH_INPUT_IS_REVERSED=1,RESHADE_DEPTH_INPUT_IS_LOGARITHMIC=0"<< std::endl;
	outfile<<"PresetPath="<< a <<"\\Presets\\Mod OFF.ini"<< std::endl;
	outfile<<"PresetTransitionDelay=995"<< std::endl;
	outfile<<"SkipLoadingDisabledEffects=0"<< std::endl;
	outfile<<"TextureSearchPaths="<< a <<"\\reshade-shaders\\Textures\\**"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[INPUT]"<< std::endl;
	outfile<<"ForceShortcutModifiers=1"<< std::endl;
	outfile<<"InputProcessing=2"<< std::endl;
	outfile<<"KeyEffects=189,0,0,0"<< std::endl;
	outfile<<"KeyNextPreset=0,0,0,0"<< std::endl;
	outfile<<"KeyOverlay=36,0,0,0"<< std::endl;
	outfile<<"KeyPerformanceMode=80,0,0,0"<< std::endl;
	outfile<<"KeyPreviousPreset=0,0,0,0"<< std::endl;
	outfile<<"KeyReload=187,0,0,0"<< std::endl;
	outfile<<"KeyScreenshot=44,0,0,0"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[OVERLAY]"<< std::endl;
	outfile<<"ClockFormat=0"<< std::endl;
	outfile<<"FPSPosition=1"<< std::endl;
	outfile<<"NoFontScaling=0"<< std::endl;
	outfile<<"SaveWindowState=0"<< std::endl;
	outfile<<"ShowClock=2"<< std::endl;
	outfile<<"ShowForceLoadEffectsButton=1"<< std::endl;
	outfile<<"ShowFPS=2" << std::endl;
	outfile<<"ShowFrameTime=2"<< std::endl;
	outfile<<"ShowPresetName = 2" << std::endl;
	outfile<<"ShowPresetTransitionMessage=1" << std::endl;
	outfile<<"ShowScreenshotMessage=1"<< std::endl;
	outfile<<"TutorialProgress=0"<< std::endl;
	outfile<<"VariableListHeight=300.000000"<< std::endl;
	outfile<<"VariableListUseTabs=0"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[SCREENSHOT]"<< std::endl;
	outfile<<"ClearAlpha=1"<< std::endl;
	outfile<<"FileFormat=1"<< std::endl;
	outfile<<"FileNamingFormat=0"<< std::endl;
	outfile<<"JPEGQuality=100"<< std::endl;
	outfile<<"SaveBeforeShot=1"<< std::endl;
	outfile<<"SaveOverlayShot=1"<< std::endl;
	outfile<<"SavePath="<< a <<"\\ScreenShot"<< std::endl;
	outfile<<"SavePresetFile=0"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[STYLE]"<< std::endl;
	outfile<<"Alpha=1.000000"<< std::endl;
	outfile<<"ChildRounding=0.000000"<< std::endl;
	outfile<<"ColFPSText=1.000000,1.000000,0.784314,1.000000"<< std::endl;
	outfile<<"EditorFont="<< a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" <<std::endl;
	outfile<<"EditorFontSize=17"<< std::endl;
	outfile<<"EditorStyleIndex=0"<< std::endl;
	outfile<<"Font="<< a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" << std::endl;
	outfile<<"FontSize=17"<< std::endl;
	outfile<<"FPSScale=1.000000"<< std::endl;
	outfile<<"FrameRounding=0.000000"<< std::endl;
	outfile<<"GrabRounding=0.000000"<< std::endl;
	outfile<<"LatinFont="<< a << "\\InjectResource\\Fonts\\MiSans-Bold.ttf" << std::endl;
	outfile<<"PopupRounding=0.000000"<< std::endl;
	outfile<<"ScrollbarRounding=0.000000"<< std::endl;
	outfile<<"StyleIndex=2"<< std::endl;
	outfile<<"TabRounding=4.000000"<< std::endl;
	outfile<<"WindowRounding=0.000000"<< std::endl;
	
    outfile.close();
    exit(0);
    return 0;  
}