//Make response artillery fire by independent side
	
	while {   ( count (magazinesAmmo gunind) > 1 && alive gunnerind ) || (count (magazinesAmmo BIS_IA_mortar1) > 1 && alive gunnerind1 ) } do
		{
				
				
				
			
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_check_knows = 0;
			_i = 0;
			// Fire mortar in village
			while {   _i < _count-1 && alive gunnerind1 && _check_knows == 0 } do
			{
						
			if ( !isNil {_thislist select _i} && alive (_thislist select _i)  )	then 
				{
								
						_target = _thislist select _i;
						if (  heli_lead knowsAbout _target > 2  || heli_pil knowsAbout _target > 2 || alp13_ind_lead knowsAbout _target > 2  || alp33_ind_lead knowsAbout _target > 2  || alp12_ind_lead knowsAbout _target > 2   ) then 
						{
						
							Hint "Response independent mortar2 fire";
							_check_knows = 1;
							_tgt2 = [ (getPos _target select 0) + ((random 10) - 20), (getPos _target select 1) + ((random 10) - 20), 0]; 
							_ammo2 = getArtilleryAmmo[gunind] select 0;
							gunind doArtilleryFire[_tgt2,_ammo2,1];
							Sleep 10;
						
						};
														
				};
			_i = _i + 1;
			};
			
			// Fire mortar in military base
			while {   _i < _count-1 && alive gunnerind && _check_knows == 0 } do
			{
			
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
							
							
