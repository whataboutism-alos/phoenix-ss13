/datum/species/tajaran
	name = "Tajaran"
	id = "tajaran"
	flavor_text = "Covered in coarse fur, tajarans are a sapient species which places great emphasis on appearance. They lead a large federation beyond Skrell space, not much is known of their inner social workings. Most enjoy meats, and raw foods, in fact they will eat just about anything!"
	default_color = "444"
	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAS_FLESH,
		HAS_BONE,
		HAIR,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	default_mutant_bodyparts = list(
		"tail" = ACC_RANDOM,
		"snout" = ACC_RANDOM,
		"ears" = ACC_RANDOM,
		"legs" = "Normal Legs",
	)
	cultures = list(CULTURES_GENERIC, CULTURES_HUMAN, CULTURES_TAJARAN)
	locations = list(LOCATIONS_GENERIC, LOCATIONS_HUMAN, LOCATIONS_TAJARAN)
	factions = list(FACTIONS_GENERIC, FACTIONS_HUMAN, FACTIONS_TAJARAN)
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	disliked_food = PINEAPPLE
	liked_food = GROSS | MEAT | RAW | TOXIC | NUTS | GRAIN
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon = 'icons/mob/species/anthro_parts_greyscale.dmi'
	limbs_id = "mammal"
	scream_sounds = list(
		NEUTER = 'sound/voice/cat_scream.ogg',
	)

/datum/species/tajaran/get_random_features()
	var/list/returned = MANDATORY_FEATURE_LIST
	var/main_color
	var/second_color
	var/random = rand(1,5)
	//Choose from a variety of mostly coldish, animal, matching colors
	switch(random)
		if(1)
			main_color = "BBAA88"
			second_color = "AAAA99"
		if(2)
			main_color = "777766"
			second_color = "888877"
		if(3)
			main_color = "AA9988"
			second_color = "AAAA99"
		if(4)
			main_color = "EEEEDD"
			second_color = "FFEEEE"
		if(5)
			main_color = "DDCC99"
			second_color = "DDCCAA"
	returned["mcolor"] = main_color
	returned["mcolor2"] = second_color
	returned["mcolor3"] = second_color
	return returned

/datum/species/tajaran/get_random_body_markings(list/passed_features)
	var/name = pick(
		"Tajaran",
		"Floof",
		"Floofer",
	)
	var/datum/body_marking_set/BMS = GLOB.body_marking_sets[name]
	var/list/markings = list()
	if(BMS)
		markings = assemble_body_markings_from_set(BMS, passed_features, src)
	return markings

/datum/species/tajaran/random_name(gender,unique,lastname)
	var/randname
	if(gender == MALE)
		randname = pick(GLOB.first_names_male_taj)
	else
		randname = pick(GLOB.first_names_female_taj)

	if(lastname)
		randname += " [lastname]"
	else
		randname += " [pick(GLOB.last_names_taj)]"

	return randname
