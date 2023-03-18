//Make response artillery fire by independent side
	private _gunnergroup = createGroup [east, false];
	_gunner = gunnerind;
	private _gunnergroup = createGroup [east, false];
	[_gunner] join _gunnergroup;
	
	
	while {   count (magazinesAmmo BIS_IA_mortar1) > 1 && (count (units alp22ind) > 1 ||  alive gunnerind) } do        
			{
				
			//assign new gunner if gunnerind not alive
			if (count (crew BIS_IA_mortar1) == 0 &&   count (magazinesAmmo BIS_IA_mortar1) > 1 && count (units _gunnergroup) == 0) then
				{
					Hint "gunner 1 killed";
													
					//Assign random unit to place at gunner seat
											
						_gunner =  selectRandom  (units alp22ind);
						[_gunner] join _gunnergroup;
						_gunner setSpeedMode "FULL";
						_gunner doMove (position BIS_IA_mortar1);
						_gunner assignAsGunner BIS_IA_mortar1;
						_gunner in BIS_IA_mortar1;
						[_gunner] orderGetIn true;
							
						Hint "promoted new gunner to mortar 1";
													
				};
			// End assign newgunner block




			//Mortar fire
				
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_check_knows = 0;
			_i = 0;
			
		while {   _i < _count-1 && _check_knows == 0 } do
			{
			
			if ( !isNil {_thislist select _i} && alive (_thislist select _i)   )	then 
				{
								
						_target = _thislist select _i;
						if ( count (crew BIS_IA_mortar1) > 0 &&(  alp24indComm knowsAbout _target > 2 || alp25indComm knowsAbout _target > 2 || alp22indComm knowsAbout _target > 2 || at_nyx_comm knowsAbout _target > 1 || strider1C knowsAbout _target > 1  )  ) then 
						{
						
							Hint "Response independent mortar fire";
							_check_knows = 1;
							_tgt2 = [ (getPos _target select 0) + ((random 80) - 40), (getPos _target select 1) + ((random 80) - 40), 0]; 
							_ammo2 = getArtilleryAmmo[BIS_IA_mortar1] select 0;
							BIS_IA_mortar1 doArtilleryFire[_tgt2,_ammo2,1];
							Sleep 7;
						
						};
														
				};
			_i = _i + 1;
			};
			
		};	
							
