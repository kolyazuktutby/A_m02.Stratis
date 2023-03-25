	if {   count (units alp33_ind) < 2  && alive gunind } do
		{	
		//assign random  new gunner if gunnerind1 not alive
			
			_gunner =  selectRandom  (units brv11ind);
			_gunner setSpeedMode "FULL";
			_gunner doMove (position gunind);
			_gunner assignAsGunner gunind;
			_gunner in gunind;
			[_gunner] orderGetIn true;
					
			Hint "promoted new gunner with new group soldier";
													
				
			// End assign newgunner block	
		
			while {   count (magazinesAmmo gunind) > 1 &&  alive _gunner) } do
			{
				
			private _targetlist = [];	
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_i = 0;
			
			
			
			
			
			
			if (!isNil {_thislist select _i}  && alive (_thislist select _i) )	then 
				{
				
						_target = _thislist select _i;
				
						if ( brv11indC knowsAbout _target > 1 || NyxIndC knowsAbout _target > 1 || alp11ind_lead knowsAbout _target > 1 || heli_lead knowsAbout _target > 1  || gunnerind1 knowsAbout _target > 1 || heli_pil knowsAbout _target > 1 || alp120pfComm knowsAbout _target > 1  || alp13_ind_lead knowsAbout _target > 2  || alp33_ind knowsAbout _target > 2  || alp12_ind_lead knowsAbout _target > 2  || alp13ind_lead knowsAbout _target > 2 ) then 
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
		
						
			//Mortar fire
			if (  count _targetlist > 0 && alive gunind) then
							{
								Hint "Response independent mortar2 fire";
								for [{ _j = 0 }, { _j <  3 }, { _j = _j + 1 }] do 
								{
								
								_victim = (selectRandom _targetlist);
								_tgt2posx = (getPos _victim select 0)  + ((random 80) - 40);
								_tgt2posy = (getPos _victim select 1)  + ((random 80) - 40);
								_tgt2 = [ _tgt2posx, _tgt2posy, 0]; 
								_ammo2 = getArtilleryAmmo[gunind] select 0;
								gunind doArtilleryFire[_tgt2,_ammo2,1];
								Sleep 10;
								};									
							};
			
			
			};	
			
			//Get out from mortar if alive

	_gunner leaveVehicle gunind;
	_gunner move (getMarkerPos "BIS_UAV1");
	
			
			
		};
							
	

	
