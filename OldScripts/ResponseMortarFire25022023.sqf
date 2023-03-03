//Make response artillery fire by independent side
	
	while {   count (magazinesAmmo BIS_IA_mortar1) > 1 && alive gunnerind} do
			{
				
				
				
			
			private _thislist = (list triggerdarter1);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_check_knows = 0;
			_i = 0;
			
			while {   _i < _count-1 && alive gunnerind && _check_knows == 0 } do
			{
			
			//Hint str _i;
			//Sleep 0.1;
			//Hint str (_thislist select _i);
			//Sleep 2; 
		
			
			if ( !isNil {_thislist select _i} && alive (_thislist select _i)  && ( side (_thislist select _i) == west ) )	then 
				{
								
						_target = _thislist select _i;
						if ( (  alp24indComm knowsAbout _target > 2 || alp25indComm knowsAbout _target > 2 || alp22indComm knowsAbout _target > 2 || at_nyx_comm knowsAbout _target > 1 )  ) then 
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
							
							
