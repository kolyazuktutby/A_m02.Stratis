{_x setpos (getWPPos [alp32_nato, 1])} foreach units alp32_nato;
{_x setpos (getWPPos [alp23_nato, 1])} foreach units alp23_nato;
{_x setpos (getWPPos [alp25_nato, 1])} foreach units alp25_nato;


offroadnatoD doMove (getMarkerPos "marker_1");
offroadnatoD setSpeedMode "FULL";
Sleep 25;
		
		
		
while {   count (magazinesAmmo gunnato1) > 1} do
	{
		_tgt1 = [(getMarkerPos "BIS_UAV2" select 0) + (random 120), (getMarkerPos "BIS_UAV2" select 1) + (random 150), 0]; 
		_ammo1 = getArtilleryAmmo[gunnato1] select 0;
		gunnato1 doArtilleryFire[_tgt1,_ammo1,1];
		Sleep 5;
	};






	if (count (magazinesAmmo gunnato1) == 1 ) then
	{
		
		Hint "No explosive rounds!";
		offroadnatoD leaveVehicle offroadnato;
		gunnato1G leaveVehicle gunnato1;
		gunnato1G setPos (offroadnato getPos [5,45]);
		n_alp12 move (getMarkerPos "BIS_UAV2");
		n_alp12 setSpeedMode "FULL";
		
		
	};
		
	