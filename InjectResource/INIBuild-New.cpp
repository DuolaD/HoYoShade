#include <iostream>  
#include <fstream>  
#include <string>  
#include <cstdlib>  
#include <unistd.h>  
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
    std::string b = get_selfpath(); 

    a = a.substr(0, a.find_last_of("\\/")); 
    std::string filepath = a + "/ReShade.ini"; 
    std::ofstream outfile(filepath); 
    
        outfile<<"[ADDON]"<< std::endl;
    outfile<<"AddonPath="<< a <<"\\reshade-shaders\\Addons"<< std::endl;
    outfile<<"DisabledAddons="<< std::endl;
    outfile<<""<< std::endl;
	outfile<<"[DEPTH]"<< std::endl;
	outfile<<"DepthCopyAtClearIndex=0"<< std::endl;
	outfile<<"DepthCopyBeforeClears=0"<< std::endl;
	outfile<<"UseAspectRatioHeuristics=1"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[GENERAL]"<< std::endl;
	outfile<<"EffectSearchPaths="<< a <<"\\reshade-shaders\\Shaders\\"<< std::endl;
	outfile<<"PerformanceMode=0"<< std::endl;
	outfile<<"PreprocessorDefinitions=RESHADE_DEPTH_LINEARIZATION_FAR_PLANE=1000.0,RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN=1,RESHADE_DEPTH_INPUT_IS_REVERSED=1,RESHADE_DEPTH_INPUT_IS_LOGARITHMIC=0"<< std::endl;
	outfile<<"PresetPath="<< a <<"\\Presets\\Mod OFF.ini"<< std::endl;
	outfile<<"PresetTransitionDelay=995"<< std::endl;
	outfile<<"SkipLoadingDisabledEffects=0"<< std::endl;
	outfile<<"TextureSearchPaths="<< a <<"\\reshade-shaders\\Textures\\"<< std::endl;
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
	outfile<<"ShowClock=0"<< std::endl;
	outfile<<"ShowForceLoadEffectsButton=1"<< std::endl;
	outfile<<"ShowFPS=0"<< std::endl;
	outfile<<"ShowFrameTime=0"<< std::endl;
	outfile<<"ShowScreenshotMessage=1"<< std::endl;
	outfile<<"TutorialProgress=4"<< std::endl;
	outfile<<"VariableListHeight=300.000000"<< std::endl;
	outfile<<"VariableListUseTabs=0"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[SCREENSHOT]"<< std::endl;
	outfile<<"ClearAlpha=1"<< std::endl;
	outfile<<"FileFormat=1"<< std::endl;
	outfile<<"FileNamingFormat=0"<< std::endl;
	outfile<<"JPEGQuality=90"<< std::endl;
	outfile<<"SaveBeforeShot=0"<< std::endl;
	outfile<<"SaveOverlayShot=0"<< std::endl;
	outfile<<"SavePath="<< a <<"\\ScreenShot"<< std::endl;
	outfile<<"SavePresetFile=0"<< std::endl;
	outfile<<""<< std::endl;
	outfile<<"[STYLE]"<< std::endl;
	outfile<<"Alpha=1.000000"<< std::endl;
	outfile<<"ChildRounding=0.000000"<< std::endl;
	outfile<<"ColFPSText=1.000000,1.000000,0.784314,1.000000"<< std::endl;
	outfile<<"EditorFont="<< b << "\\msyhbd.ttc" <<std::endl;
	outfile<<"EditorFontSize=13"<< std::endl;
	outfile<<"EditorStyleIndex=0"<< std::endl;
	outfile<<"Font="<< b << "\\msyhbd.ttc" << std::endl;
	outfile<<"FontSize=13"<< std::endl;
	outfile<<"FPSScale=1.000000"<< std::endl;
	outfile<<"FrameRounding=0.000000"<< std::endl;
	outfile<<"GrabRounding=0.000000"<< std::endl;
	outfile<<"LatinFont="<< b << "\\msyhbd.ttc" << std::endl;
	outfile<<"PopupRounding=0.000000"<< std::endl;
	outfile<<"ScrollbarRounding=0.000000"<< std::endl;
	outfile<<"StyleIndex=2"<< std::endl;
	outfile<<"TabRounding=4.000000"<< std::endl;
	outfile<<"WindowRounding=0.000000"<< std::endl;
	
    outfile.close();
    exit(0);
    return 0;  
}