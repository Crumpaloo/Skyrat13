/proc/init_advanced_customization()
	//Attributes
	for(var/path in subtypesof(/datum/attribute))
		var/datum/attribute/AT = new path()
		GLOB.attribute_list[AT.id] = AT

	//Skill categories
	for(var/path in subtypesof(/datum/skill_category))
		var/datum/skill_category/SC = new path()
		GLOB.skill_cat_list[SC.id] = SC

	//Skills
	for(var/path in subtypesof(/datum/skill))
		var/datum/skill/SK = new path()
		GLOB.skill_list[SK.id] = SK

	//Skills per category, helper list
	for(var/datum/skill_category/SC in GLOB.skill_cat_list)
		var/skill_list = list()
		for(var/datum/skill/SK)
			if(SK.cat_id == SC.id)
				skill_list += SK
		GLOB.skills_per_cat_list[SC.id] = skill_list

	//Augments

	for(var/path in subtypesof(/datum/aug_type))
		var/datum/aug_type/at = new path()
		at.cat_list = list()
		GLOB.aug_type_list[at.id] = at

	for(var/path in subtypesof(/datum/aug_category/limb))
		var/datum/aug_category/limb/aug_cat = new path()
		aug_cat.aug_list = list()
		GLOB.aug_type_list[aug_cat.aug_type].cat_list[aug_cat.id] = aug_cat
		for(var/path2 in subtypesof(aug_cat.children_path_type))
			var/datum/augmentation/limb/aug = new path2()
			GLOB.aug_type_list[aug.type_id].cat_list[aug.cat_id].aug_list[aug.id] = aug

	for(var/path in subtypesof(/datum/aug_category/organ))
		var/datum/aug_category/organ/aug_cat = new path()
		aug_cat.aug_list = list()
		GLOB.aug_type_list[aug_cat.aug_type].cat_list[aug_cat.id] = aug_cat
		for(var/path2 in subtypesof(aug_cat.children_path_type))
			var/datum/augmentation/organ/aug = new path2()
			GLOB.aug_type_list[aug.type_id].cat_list[aug.cat_id].aug_list[aug.id] = aug

	for(var/path in subtypesof(/datum/aug_category/implant))
		var/datum/aug_category/implant/aug_cat = new path()
		aug_cat.aug_list = list()
		GLOB.aug_type_list[aug_cat.aug_type].cat_list[aug_cat.id] = aug_cat
		for(var/path2 in subtypesof(aug_cat.children_path_type))
			var/datum/augmentation/implant/aug = new path2()
			GLOB.aug_type_list[aug.type_id].cat_list[aug.cat_id].aug_list[aug.id] = aug
