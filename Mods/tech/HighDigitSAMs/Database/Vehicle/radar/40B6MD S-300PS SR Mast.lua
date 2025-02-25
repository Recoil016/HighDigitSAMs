GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);
GT.chassis.life = 4;

GT.visual.shape = "40b6md_mast";
GT.visual.shape_dstr = "40b6md_mast_d";
GT.visual.fire_pos[2] = 1;

GT.animation_arguments.locator_rotation = 1;
GT.radar_rotation_period = 3.0;
GT.snd.radarRotation = "RadarRotation";

GT.sensor = {};
GT.sensor.max_range_finding_target = 60000;
GT.sensor.min_range_finding_target = 2000;
GT.sensor.max_alt_finding_target = 3000;
GT.sensor.height = 42.158;

GT.CustomAimPoint = {0,1.5,0}

GT.WS = {};
GT.WS.maxTargetDetectionRange = 60000;
GT.WS.radar_type = 103;
GT.WS.radar_rotation_type = 0;

--Burning after hit
GT.visual.fire_size = 0.5; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 900; --burning time (seconds)

GT.Name = "S-300PS SA-10B 40B6MD MAST sr";
GT.DisplayName = _("SAM SA-10B S-300PS Clam Shell SR");
GT.DisplayNameShort = _("SA-10B SR");
GT.Rate = 20;

local ws = 0;
for i = 1,15 do -- 15 target tracker's
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].pos = {0,42.158,0}
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(10)},
					};
    GT.WS[ws].omegaY = 3
    GT.WS[ws].omegaZ = 3
    GT.WS[ws].LN = 
    {
        {
        type = 101,
		reflection_limit = 0.049,
        distanceMax = GT.sensor.max_range_finding_target,
		ECM_K = 0.65,
        min_trg_alt = 5,
        max_trg_alt = 3000,
        reactionTime = 3;
        },
    }
end --for

GT.Sensors = { RADAR = GT.Name, };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,V_40B6MD,
				"LR SAM",
				"SAM SR",
				"RADAR_BAND1_FOR_ARM",
				"CustomAimPoint",
				};
GT.category = "Air Defence";
GT.tags = { "Air Defence", "Search Radar" };

add_surface_unit(GT)