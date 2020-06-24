for _,roboport in pairs(data.raw["roboport"]) do
	roboport.charging_offsets=
	{
		{-1.2,-0.8},{-1.8,-0.2},
		{1.8,-0.2},{1.2,-0.8},
		{1.8,1.2},{1.2,1.8},
		{-1.2,1.8},{-1.8,1.2},
	}
	roboport.energy_source.input_flow_limit="10".."MW"
		if logistics_radius==0 or construction_radius==0 then goto next_roboport end
		local chunk_radius=math.ceil(roboport.construction_radius/32)
		local roboport_name=roboport.name
		local roboport_localised_name=roboport.localised_name or {"entity-name."..roboport_name }
		data:extend({
		{
			type="radar",
			name=roboport_name.."-radar",
			localised_name={"entity-name.Roboport_Radar",roboport_localised_name},
			icon="__base__/graphics/icons/radar.png",
			icon_size=64,icon_mipmaps=4,
			order="d-f",
			max_health=1,
			flags={"no-automated-item-insertion","no-automated-item-removal"},
			collision_box=roboport.collision_box,
			collision_mask={},
			selectable_in_game=false,
			energy_per_sector="10MJ",
			max_distance_of_sector_revealed=0,
			max_distance_of_nearby_sector_revealed=chunk_radius,
			energy_per_nearby_scan="3J",
			energy_source=
			{
				type="electric",
				usage_priority="secondary-input",
				render_no_power_icon=false,
				render_no_network_icon=false
			},
			energy_usage="1W",
			pictures=
			{
				filename="__base__/graphics/entity/radar/radar.png",
				priority="low",
				width=1,
				height=1,
				apply_projection=false,
				direction_count=1,
				line_length=1,
				shift={0.0,0.0}
			}
		},
	})
	::next_roboport::
end