#include <sdktools>

public Plugin myinfo =
{
	name 		= 	"Borderlands Outline",
	author 		= 	"myst",
	description	=	"Adds a black outline to everything.",
	version 	= 	"1.0"
};

public void OnEntitySpawn(int iEntity)
{
	int iOutline = CreateEntityByName("tf_glow");
	char sTargetName[64];
	Format(sTargetName, sizeof(sTargetName), "EntityOutline%i", iEntity);
	DispatchKeyValue(iOutline, "target", sTargetName);
	DispatchKeyValue(iOutline, "Mode", "0");
	DispatchSpawn(iOutline);
	AcceptEntityInput(iOutline, "Enable");
	
	SetVariantColor({ 0, 0, 0, 255 });
	AcceptEntityInput(iOutline, "SetGlowColor");
	
	SetVariantString("!activator");
	AcceptEntityInput(iOutline, "SetParent", iEntity);
}