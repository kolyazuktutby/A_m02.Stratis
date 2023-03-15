while {alive darter1 || alive darter2 } do

{
		
		
		private _target_d1 = [];
		private _target_d2 = [];
		

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
				
				if ( alive (_thislist select _i) && ( side (_thislist select _i) == east || side (_thislist select _i) == resistance ) ) then
				
					{
				
					_target = _thislist select _i;
				
						if ( darter1 knowsAbout _target > 1 && alive darter1) then 
						{
						_target_d1 pushBack _target;	
						};
	
						if ( darter2 knowsAbout _target > 1 && alive darter2) then 
						{
						_target_d2 pushBack _target;	
						};
			
														
					};
							
				};
		
			};
		if (count _target_d1 > 0)then
		{
		 
		private _rev_target_d1 = (selectRandom _target_d1);
		alp24_nato reveal _rev_target_d1;
		alp22_nato_lead reveal _rev_target_d1;
		alp22_nato_lead1 reveal _rev_target_d1;
		alp22_nato_lead2 reveal _rev_target_d1;
		alp22_nato_lead3 reveal _rev_target_d1;
		alp22_nato_lead4 reveal _rev_target_d1;
				
		alp24_nato_lead  groupChat "Darter1 reveal target";
		alp22_nato_lead groupChat "Darter1 reveal target";
		
		Sleep 0.3;

		};
	
		if (count _target_d2 > 0) then
		{
		private _rev_target_d2 = (selectRandom _target_d2);
		alp32_nato reveal _rev_target_d2;
		alp26_nato reveal _rev_target_d2;
		alp31_nato reveal _rev_target_d2;
		alp25_nato reveal _rev_target_d2;
		
		alp23_nato_lead reveal _rev_target_d2;
		alp23_nato_lead1 reveal _rev_target_d2;
		alp23_nato_lead3 reveal _rev_target_d2;
		
		
		
		alp32_nato_lead groupChat "Darter2 reveal target";
		alp26_nato_lead groupChat "Darter2 reveal target";
		alp31_nato_lead groupChat "Darter2 reveal target";
		alp25_nato_lead groupChat "Darter2 reveal target";
			
		//Hint "darter2 reveal target";
		Sleep 0.3;

		};
	
		
	
	
	Sleep 3;
	
	};
	
};
	
	