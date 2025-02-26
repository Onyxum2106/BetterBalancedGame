-- 16/04/23 Ramses wonder culture % from 30 to 25 (also reduces buildings per 5)
UPDATE ModifierArguments SET Value=25 WHERE ModifierId='RAMSES_CULTURE_POSITIVE_WONDERS_BUILDINGS' AND Name='BuildingProductionPercent';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_RAMSES_CULTURE_POSITIVE_BUILDINGS_IF_WONDER', 'MODIFIER_PLAYER_CITIES_GRANT_YIELD_PER_BUILDING_COST', 'CITY_HAS_WONDER_REQUIREMENTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_CULTURE_POSITIVE_BUILDINGS_IF_WONDER', 'YieldType', 'YIELD_CULTURE'),
    ('BBG_RAMSES_CULTURE_POSITIVE_BUILDINGS_IF_WONDER', 'BuildingProductionPercent', 10),
    ('BBG_RAMSES_CULTURE_POSITIVE_BUILDINGS_IF_WONDER', 'IncludeWonder', 0);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_CULTURE_POSITIVE_BUILDINGS_IF_WONDER');

UPDATE ModifierArguments SET Value=-15 WHERE ModifierId='RAMSES_CULTURE_NEGATIVE_BUILDINGS' AND Name='BuildingProductionPercent';
-- UPDATE Modifiers SET SubjectRequirementSetId='BBG_CITY_HAS_NO_WONDER_REQSET' WHERE ModifierId='RAMSES_CULTURE_NEGATIVE_BUILDINGS';
 

-- 02/12/24 Ramses gets culture/food on improved resources on floodplains (old Ptolematic bonus)
-- Requirement Modifier On Improved Resources
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_BONUS_RESOURCE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_BONUS_RESOURCE', 'BBG_REQUIRES_PLOT_HAS_IMPROVED_BONUS'),
    ('BBG_TILE_IS_FLOODPLAIN_BONUS_RESOURCE', 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_LUX_RESOURCE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_LUX_RESOURCE', 'BBG_REQUIRES_PLOT_HAS_IMPROVED_LUXURY'),
    ('BBG_TILE_IS_FLOODPLAIN_LUX_RESOURCE', 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_STRAT_RESOURCE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_TILE_IS_FLOODPLAIN_STRAT_RESOURCE', 'REQUIRES_PLOT_HAS_IMPROVED_STRATEGIC'),
    ('BBG_TILE_IS_FLOODPLAIN_STRAT_RESOURCE', 'REQUIRES_FLOODPLAINS_REQUIREMENT');

-- Culture Modifier
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_BONUS_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_BONUS_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_BONUS_RESOURCE', 'YieldType', 'YIELD_FAITH'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_BONUS_RESOURCE', 'Amount', '1');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_LUX_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_LUX_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_LUX_RESOURCE', 'YieldType', 'YIELD_FAITH'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_LUX_RESOURCE', 'Amount', '1');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_STRAT_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_STRAT_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_STRAT_RESOURCE', 'YieldType', 'YIELD_FAITH'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_STRAT_RESOURCE', 'Amount', '1');

-- Food Modifier
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_BONUS_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_BONUS_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_BONUS_RESOURCE', 'YieldType', 'YIELD_FOOD'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_BONUS_RESOURCE', 'Amount', '1');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_LUX_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_LUX_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_LUX_RESOURCE', 'YieldType', 'YIELD_FOOD'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_LUX_RESOURCE', 'Amount', '1');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_STRAT_RESOURCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'BBG_TILE_IS_FLOODPLAIN_STRAT_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_STRAT_RESOURCE', 'YieldType', 'YIELD_FOOD'),
    ('BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_STRAT_RESOURCE', 'Amount', '1');

-- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_BONUS_RESOURCE'),
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_LUX_RESOURCE'),
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FAITH_ON_STRAT_RESOURCE'),
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_BONUS_RESOURCE'),
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_STRAT_RESOURCE'),
--     ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_FLOODPLAINS_RESOURCE_FOOD_ON_LUX_RESOURCE');

-- 02/12/24 bonus production doubled when city is settled on river for HS and Theater
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_PTOLE_FASTER_IZ_RIVER', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
    ('BBG_PTOLE_FASTER_HS_RIVER', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_PTOLE_FASTER_IZ_RIVER', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE'),
    ('BBG_PTOLE_FASTER_IZ_RIVER', 'Amount', 15),
    ('BBG_PTOLE_FASTER_HS_RIVER', 'DistrictType', 'DISTRICT_HOLY_SITE'),
    ('BBG_PTOLE_FASTER_HS_RIVER', 'Amount', 15);
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_RAMSES', 'BBG_PTOLE_FASTER_IZ_RIVER'),
    ('TRAIT_LEADER_RAMSES', 'BBG_PTOLE_FASTER_HS_RIVER');

-- 03/12/24 Ramses gets +1 production for HS adjacent to river
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_RAMSES_RIVER_PRODUCTION_HS', 'MODIFIER_PLAYER_CITIES_RIVER_ADJACENCY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_RAMSES_RIVER_PRODUCTION_HS', 'Amount', 1),
    ('BBG_RAMSES_RIVER_PRODUCTION_HS', 'Description', 'LOC_DISTRICT_RIVER_FAITH'),
    ('BBG_RAMSES_RIVER_PRODUCTION_HS', 'DistrictType', 'DISTRICT_HOLY_SITE'),
    ('BBG_RAMSES_RIVER_PRODUCTION_HS', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_RAMSES', 'BBG_RAMSES_RIVER_PRODUCTION_HS');

