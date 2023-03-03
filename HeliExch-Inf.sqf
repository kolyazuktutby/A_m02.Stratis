//Hint "Heli script started";

while {alive heli_lead || alive heli_pil } do

{
		
		
	private _target_h1 = [];
		
	for [{  _j = 0 }, { _j < 5 }, { _j = _j + 1 }] do 
	{	
		
		private _thislist = (list triggerdarter1);
		private _target = _thislist select 0;
		private _count = (count _thislist);
		
		//Checking units  unveiled by drones and forming arrays for each drone
		for [{ private _i = 0 }, { _i < _count }, { _i = _i + 1 }] do 
			{ 
			if (!isNil {_thislist select _i}  )	then 
				{
				
				if ( alive (_thislist select _i) && ( side (_thislist select _i) == west ) ) then
				
					{
				
						_target = _thislist select _i;
				
						if ( heli_lead knowsAbout _target > 2 && alive heli_lead) then 
						{
						_target_h1 pushBack _target;	
						};
	
						if ( heli_pil knowsAbout _target > 2 && alive heli_pil) then 
						{
						_target_h1 pushBack _target;	
						};
																	
					};
							
				};
		
			};
		if (count _target_h1 > 0)then
		{
		 
		private _rev_target_h1 = (selectRandom _target_h1);
		alp13_ind_lead reveal _rev_target_h1;
		alp33_ind_lead reveal _rev_target_h1;
		alp12_ind_lead reveal _rev_target_h1;
		alp41_ind_lead reveal _rev_target_h1;
		alp120pfComm reveal _rev_target_h1;
		
				
		alp13_ind_lead groupChat "Helicopter reveal target";
		alp33_ind_lead groupChat "Helicopter reveal target";
		alp12_ind_lead groupChat "Helicopter reveal target";
		alp120pfComm groupChat "Helicopter reveal target";
		alp41_ind_lead groupChat "Helicopter reveal target";
		
		//Hint "Heli reveal target";
		Sleep 0.3;

		};
	
			
	Sleep 5;
	
	};
	
};
	
	