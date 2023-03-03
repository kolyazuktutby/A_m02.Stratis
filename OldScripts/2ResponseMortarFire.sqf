//Make response artillery fire by independent side
	
	while {   count (magazinesAmmo gunind) > 1 && alive gunnerind1} do
		{
				
				
				
			
			private _thislist = (list triggermortarind);
			private _target = _thislist select 0;
			private _count = (count _thislist);
			_check_knows = 0;
			_i = 0;
			
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
			
		};
							
							
