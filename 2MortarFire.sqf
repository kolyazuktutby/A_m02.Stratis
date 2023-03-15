//Give darter time to reveal the target 
	Sleep 5;
	
	while {   count (magazinesAmmo gunnato1) > 1} do
			{
				_tgt1 = [(getMarkerPos "marker_0" select 0) + (random 120), (getMarkerPos "marker_0" select 1) + (random 120), 0]; 
				_ammo1 = getArtilleryAmmo[gunnato1] select 0;
				gunnato1 doArtilleryFire[_tgt1,_ammo1,1];
				Sleep 5;
						
			};
							
				
	
// Checking mortars have explosive rounds
	if (count (magazinesAmmo gunnato1) == 1 ) then
	{
		
		Hint "Mortar 2 no explosive rounds!";
		gunnato1 setVehicleAmmo 1;
		Hint "Mortar 2 rearmed!";
	};
