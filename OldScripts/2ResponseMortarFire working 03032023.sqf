//Make response artillery fire by independent side
	
	_selfpos = getPos gunind;
	_selfposx = getPos gunind select 0;
	_selfposy = getPos gunind select 1;
	_check_not_crew = 0;
	_gunner = gunnerind1;
	private _gunnergroup = createGroup [east, false];
		
	while {   count (magazinesAmmo gunind) > 1 && count (units alp33_ind) > 1  } do
		{
				
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_check_knows = 0;
			_i = 0;
			
			while {   _i < _count-1 && _check_knows == 0 } do
			{
						
			if ( !isNil {_thislist select _i} && alive (_thislist select _i)  )	then 
				{
								
						_target = _thislist select _i;
						//assign new gunner if gunnerind1 not alive
						if (count (crew gunind) == 0 &&   count (magazinesAmmo gunind) > 1 && alive gunind && _check_not_crew == 0 ) then
						{
							Hint "gunner 2 killed";
							_check_not_crew = 1;
							_gunner =  selectRandom  (units alp33_ind);
							[_gunner] join _gunnergroup;
							_gunner setSpeedMode "FULL";
							_gunner doMove (position gunind);
							_gunner assignAsGunner gunind;
							_gunner in gunind;
							[_gunner] orderGetIn true;
							
							Hint "promoted new gunner";
													
						};
						if (count (units _gunnergroup) == 0) then {_check_not_crew = 0;};
						
						
						if (  heli_lead knowsAbout _target > 1  || gunnerind1 knowsAbout _target > 1 || heli_pil knowsAbout _target > 1 || alp120pfComm knowsAbout _target > 1  || alp13_ind_lead knowsAbout _target > 2  || alp33_ind_lead knowsAbout _target > 2  || alp12_ind_lead knowsAbout _target > 2   ) then 
						{
						
							//Don't fire near mortar
							_tgt2posx = (getPos _target select 0)  + ((random 30) - 60);
							_tgt2posy = (getPos _target select 1)  + ((random 30) - 60);
							_distancex = abs (_tgt2posx - _selfposx);
							_distancey = abs (_tgt2posy - _selfposy);
														
							if (  _distancex > 40 && _distancey > 40 && count (crew gunind) > 0 ) then
							{
								Hint "Response independent mortar2 fire";
								_tgt2 = [ _tgt2posx, _tgt2posy, 0]; 
								_ammo2 = getArtilleryAmmo[gunind] select 0;
								gunind doArtilleryFire[_tgt2,_ammo2,1];
								_check_knows = 1;
								Sleep 10;
													
							};
									
						
						};
														
				};
			
			_i = _i + 1;
			};
			
		};
							
	//Get out from mortar if alive
if (count (units _gunnergroup) > 0) then
	{
	_gunnergroup leaveVehicle gunind;
	_gunnergroup doMove (getMarkerPos "BIS_UAV1");
	}

	
