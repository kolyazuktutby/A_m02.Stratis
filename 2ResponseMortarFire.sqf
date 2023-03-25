//Make response artillery fire by independent side
	
	_selfpos = getPos gunind;
	_selfposx = getPos gunind select 0;
	_selfposy = getPos gunind select 1;
	_gunner = gunnerind1;
	private _gunnergroup = createGroup [east, false];
	[_gunner] join _gunnergroup;
		
	while {   count (magazinesAmmo gunind) > 1 && count (units alp33_ind) > 1  } do
		{
			private _targetlist = [];	
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_i = 0;
			//assign new gunner if gunnerind1 not alive
			if (count (crew gunind) == 0 &&   count (magazinesAmmo gunind) > 1 && alive gunind && count (units _gunnergroup) == 0) then
				{
					Hint "gunner 2 killed";
													
					//Find nearest unit to place at gunner seat
							
					_mindistancegunner = 1000;
					for [{ _j = 0 }, { _j <  count (units alp33_ind) }, { _j = _j + 1 }] do 
						{ 
							_gunnerposx = (getPos ((units alp33_ind) select _j) select 0);
							_gunnerposy = (getPos ((units alp33_ind) select _j) select 1) ;
							_distancex = abs (_gunnerposx - _selfposx);
							_distancey = abs (_gunnerposy - _selfposy);
							_distancegunner = sqrt (_distancex^2 + _distancey^2);
							if (_mindistancegunner > _distancegunner) then
							{
							_mindistancegunner = _distancegunner;
							_gunner =  (units alp33_ind) select _j;
							};
						};
							
							
						//_gunner =  selectRandom  (units alp33_ind);
						[_gunner] join _gunnergroup;
						_gunner setSpeedMode "FULL";
						_gunner doMove (position gunind);
						_gunner assignAsGunner gunind;
						_gunner in gunind;
						[_gunner] orderGetIn true;
							
						Hint "promoted new gunner";
													
				};
			// End assign newgunner block
			
			
			
			
			for [{ private _i = 0 }, { _i < _count }, { _i = _i + 1 }] do 
			{ 
			if (!isNil {_thislist select _i}  && alive (_thislist select _i) )	then 
				{
				
						_target = _thislist select _i;
				
						if ( NyxIndC knowsAbout _target > 1 || alp11ind_lead knowsAbout _target > 1 || heli_lead knowsAbout _target > 1  || gunnerind1 knowsAbout _target > 1 || heli_pil knowsAbout _target > 1 || alp120pfComm knowsAbout _target > 1  || alp13_ind_lead knowsAbout _target > 2  || alp33_ind knowsAbout _target > 2  || alp12_ind_lead knowsAbout _target > 2  || alp13ind_lead knowsAbout _target > 2 || zu_ind_com knowsAbout _target > 2) then 
						{
							_tgt2posx = (getPos _target select 0)  + ((random 30) - 60);
							_tgt2posy = (getPos _target select 1)  + ((random 30) - 60);
							_distancex = abs (_tgt2posx - _selfposx);
							_distancey = abs (_tgt2posy - _selfposy);
							if (_distancex > 40 && _distancey > 40) then
							{
								_targetlist pushBack _target;
							};
						
						};
							
				};
		
			};
			
			//Mortar fire
			if (  count _targetlist > 0 && alive gunind) then
							{
								Hint "Response independent mortar2 fire";
								for [{ _j = 0 }, { _j <  3 }, { _j = _j + 1 }] do 
								{
								
								_victim = (selectRandom _targetlist);
								_tgt2posx = (getPos _victim select 0)  + ((random 100) - 50);
								_tgt2posy = (getPos _victim select 1)  + ((random 100) - 50);
								_tgt2 = [ _tgt2posx, _tgt2posy, 0]; 
								_ammo2 = getArtilleryAmmo[gunind] select 0;
								gunind doArtilleryFire[_tgt2,_ammo2,1];
								Sleep 10;
								};									
							};
			
			Sleep 20;
			
		};
							
	//Get out from mortar if alive
if (count (units _gunnergroup) > 0) then
	{
	_gunnergroup leaveVehicle gunind;
	_gunnergroup move (getMarkerPos "BIS_UAV1");
	}

	
