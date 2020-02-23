#include <sdktools>

bool
	g_bMapLoaded = false;
	
public Plugin myinfo =
{
	name 		= 	"Borderlands Outline",
	author 		= 	"myst",
	description	=	"Adds a black outline to everything.",
	version 	= 	"1.0"
};

public void OnMapStart() {
	g_bMapLoaded = true;	
}

public void OnMapEnd() {
	g_bMapLoaded = false;	
}

public void OnEntityCreated(int iEntity, const char[] sClassname)
{
	if (g_bMapLoaded)
	{
		if (!StrEqual(sClassname, "tf_glow"))
		{
			int iOutline = CreateEntityByName("tf_glow");
			
			char sOldname[128];
			GetEntPropString(iEntity, Prop_Data, "m_iName", sOldname, sizeof(sOldname));
			
			char sTargetName[128];
			Format(sTargetName, sizeof(sTargetName), "%s%i", sClassname, iEntity);
			DispatchKeyValue(iEntity, "targetname", sTargetName);
			
			DispatchKeyValue(iOutline, "target", sTargetName);
			DispatchKeyValue(iOutline, "Mode", "2");
			DispatchSpawn(iOutline);
			AcceptEntityInput(iOutline, "Enable");
			
			SetVariantColor({ 255, 255, 255, 255 });
			AcceptEntityInput(iOutline, "SetGlowColor");
			
			SetVariantString("!activator");
			AcceptEntityInput(iOutline, "SetParent", iEntity);
			
			SetEntPropString(iEntity, Prop_Data, "m_iName", sOldname);
		}
	}
}