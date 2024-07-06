--==============================================================
--******                G O V E R N O R S                 ******
--==============================================================

--=============================================================================================
--=                                       AMANI                                               =
--=============================================================================================

-- Delete old promote
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY';
DELETE FROM GovernorPromotionPrereqs WHERE PrereqGovernorPromotion='GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY';

-- 5 turns

-- Default Messenger : Can be assigned to a City-state, where she acts as 2 Envoys. When established in a City-state, your cities that have Trade route to this city gain +2 Food and +2 Production             
INSERT INTO Requirements(RequirementId, RequirementType) VALUES
    ('PLAYER_HAS_CS_AMANI_CITY_FLAG_REQ', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQ', 'REQUIREMENT_PLOT_PROPERTY_MATCHES');
INSERT INTO RequirementArguments(RequirementId, Name, Value) VALUES
    ('PLAYER_HAS_CS_AMANI_CITY_FLAG_REQ', 'PropertyName', 'AMANI_ESTABLISHED_CS'),
    ('PLAYER_HAS_CS_AMANI_CITY_FLAG_REQ', 'PropertyMinimum', '1'),
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQ', 'PropertyName', 'TRADER_TO_AMANI_CS'),
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQ', 'PropertyMinimum', '1');
INSERT INTO RequirementSets(RequirementSetId, RequirementSetType) VALUES
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId, RequirementId) VALUES
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG', 'PLAYER_HAS_CS_AMANI_CITY_FLAG_REQ'),
    ('CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQ');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CS_AMANI_GIVES_2_FOOD_MODIFIER_BBG', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG'),
    ('CS_AMANI_GIVES_2_PROD_MODIFIER_BBG', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('CS_AMANI_GIVES_2_FOOD_MODIFIER_BBG', 'YieldType', 'YIELD_FOOD'),
    ('CS_AMANI_GIVES_2_FOOD_MODIFIER_BBG', 'Amount', 2),
    ('CS_AMANI_GIVES_2_PROD_MODIFIER_BBG', 'YieldType', 'YIELD_PRODUCTION'),
    ('CS_AMANI_GIVES_2_PROD_MODIFIER_BBG', 'Amount', 2);    
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_MAJOR_CIV', 'CS_AMANI_GIVES_2_FOOD_MODIFIER_BBG'),
    ('TRAIT_LEADER_MAJOR_CIV', 'CS_AMANI_GIVES_2_PROD_MODIFIER_BBG');  

-- LI Negotiator : City cannot be put under Siege and gains +5 City Defense Strength.       
INSERT INTO Types (Type, Kind) VALUES ('BBG_GOVERNOR_PROMOTION_NEGOTIATOR', 'KIND_GOVERNOR_PROMOTION');
INSERT INTO GovernorPromotionSets (GovernorType, GovernorPromotion) VALUES ('GOVERNOR_THE_AMBASSADOR', 'BBG_GOVERNOR_PROMOTION_NEGOTIATOR');
INSERT INTO GovernorPromotions (GovernorPromotionType, Name, Description, Level, Column) VALUES
    ('BBG_GOVERNOR_PROMOTION_NEGOTIATOR', 'LOC_GOVERNOR_PROMOTION_AMBASSADOR_NEGOTIATOR_NAME', 'LOC_GOVERNOR_PROMOTION_AMBASSADOR_NEGOTIATOR_DESCRIPTION', 1, 0);
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
    ('BBG_GOVERNOR_PROMOTION_NEGOTIATOR', 'DEFENDER_ADJUST_CITY_DEFENSE_STRENGTH'),
    ('BBG_GOVERNOR_PROMOTION_NEGOTIATOR', 'DEFENSE_LOGISTICS_SIEGE_PROTECTION');
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('BBG_GOVERNOR_PROMOTION_NEGOTIATOR', 'GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER');  

-- RI Affluence : Provides +2 additional Strategic Resources per turn of each one you have revealed.     
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE';
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('HORSES_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_HORSES'),
    ('IRON_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_IRON'),
    ('NITER_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_NITER'),
    ('COAL_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_COAL'),
    ('ALUMINUM_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_ALUMINUM'),
    ('OIL_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_OIL'),
    ('URANIUM_AMANI_AMOUNT_MODIFIER', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'BBG_PLAYER_CAN_SEE_URANIUM');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('HORSES_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_HORSES'),
    ('HORSES_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('IRON_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_IRON'),
    ('IRON_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('NITER_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_NITER'),
    ('NITER_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('COAL_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_COAL'),
    ('COAL_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('ALUMINUM_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_ALUMINUM'),
    ('ALUMINUM_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('OIL_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_OIL'),
    ('OIL_AMANI_AMOUNT_MODIFIER', 'Amount', '2'),
    ('URANIUM_AMANI_AMOUNT_MODIFIER', 'ResourceType', 'RESOURCE_URANIUM'),
    ('URANIUM_AMANI_AMOUNT_MODIFIER', 'Amount', '2');
INSERT INTO GovernorPromotionModifiers VALUES
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'HORSES_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'IRON_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'NITER_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'COAL_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'ALUMINUM_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'OIL_AMANI_AMOUNT_MODIFIER'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'URANIUM_AMANI_AMOUNT_MODIFIER');    

-- LII Local Informant : All cities within 9 tiles gain +4 Loyalty per turn towards your civilization. Spy operate with 3 malus level in the city
UPDATE GovernorPromotions SET Level=2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_LOCAL_INFORMANTS';    
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='BBG_GOVERNOR_PROMOTION_NEGOTIATOR' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_LOCAL_INFORMANTS';
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
        ('GOVERNOR_PROMOTION_LOCAL_INFORMANTS', 'PRESTIGE_IDENTITY_PRESSURE_TO_DOMESTIC_CITIES');
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='EMISSARY_IDENTITY_PRESSURE_TO_FOREIGN_CITIES' AND Name='Amount';
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='PRESTIGE_IDENTITY_PRESSURE_TO_DOMESTIC_CITIES' AND Name='Amount';

-- RII Foreign Investor : +1food/+1prod/+3gold to traders sent to city state where established
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR';
DELETE FROM GovernorPromotionPrereqs WHERE PrereqGovernorPromotion='GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR';

INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_CS_AMANI_GIVES_1_FOOD_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG'),
    ('BBG_CS_AMANI_GIVES_1_PROD_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG'),
    ('BBG_CS_AMANI_GIVES_3_GOLD_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_OWN_AMANI_TRADEROUT_REQSET_BBG');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_CS_AMANI_GIVES_1_FOOD_MODIFIER', 'YieldType', 'YIELD_FOOD'),
    ('BBG_CS_AMANI_GIVES_1_FOOD_MODIFIER', 'Amount', 1),
    ('BBG_CS_AMANI_GIVES_1_PROD_MODIFIER', 'YieldType', 'YIELD_PRODUCTION'),
    ('BBG_CS_AMANI_GIVES_1_PROD_MODIFIER', 'Amount', 1),
    ('BBG_CS_AMANI_GIVES_3_GOLD_MODIFIER', 'YieldType', 'YIELD_GOLD'),
    ('BBG_CS_AMANI_GIVES_3_GOLD_MODIFIER', 'Amount', 3);    
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_LEADER_MAJOR_CIV', 'BBG_CS_AMANI_GIVES_1_FOOD_MODIFIER'),
    ('TRAIT_LEADER_MAJOR_CIV', 'BBG_CS_AMANI_GIVES_1_PROD_MODIFIER'),
    ('TRAIT_LEADER_MAJOR_CIV', 'BBG_CS_AMANI_GIVES_3_GOLD_MODIFIER'); 
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR', 'GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE');

-- MIII Puppeteer : While established in a city-state, doubles the number of envoys you have there.
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER', 'GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR');



-- -- Correct Amani's Spies promo
-- INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
--         ('GOVERNOR_PROMOTION_LOCAL_INFORMANTS', 'GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE');
-- UPDATE GovernorPromotions SET Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_LOCAL_INFORMANTS';


--=============================================================================================
--=                                        LIANG                                              =
--=============================================================================================

-- 07/12/22 Liang 3 turns
-- xx/xx/xx Liang 4 turns ?
-- 06/07/24 Liang rework stay to 4 turns
UPDATE Governors SET TransitionStrength=125 WHERE GovernorType='GOVERNOR_THE_BUILDER';

-- LI Reinforced Materials : Prod +1 for floodplains and volcanic soils. This city's improvements, buildings and District Districts cannot be damaged by Environmental Effects.
UPDATE GovernorPromotions SET Level=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_REQUIRES_PLOT_HAS_VOLCANIC_SOIL', 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_REQUIRES_PLOT_HAS_VOLCANIC_SOIL', 'PLOT_VOLCANIC_SOIL_REQUIREMENT');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_REINFORCED_INFRASTRUCTURE_FLOODPLAINS_PROD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'BBG_REQUIRES_PLOT_HAS_FLOODPLAINS'),
    ('BBG_REINFORCED_INFRASTRUCTURE_VOLCANO_PROD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'BBG_REQUIRES_PLOT_HAS_VOLCANIC_SOIL');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_REINFORCED_INFRASTRUCTURE_FLOODPLAINS_PROD', 'YieldType', 'YIELD_PRODUCTION'),
    ('BBG_REINFORCED_INFRASTRUCTURE_FLOODPLAINS_PROD', 'Amount', '1'),
    ('BBG_REINFORCED_INFRASTRUCTURE_VOLCANO_PROD', 'YieldType', 'YIELD_PRODUCTION'),
    ('BBG_REINFORCED_INFRASTRUCTURE_VOLCANO_PROD', 'Amount', '1');
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
    ('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'BBG_REINFORCED_INFRASTRUCTURE_FLOODPLAINS_PROD'),
    ('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'BBG_REINFORCED_INFRASTRUCTURE_VOLCANO_PROD');

-- RI Agriculture : +1 food on every resource
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotions WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';
DELETE FROM GovernorPromotionSets WHERE GovernorPromotion='GOVERNOR_PROMOTION_AQUACULTURE';
INSERT INTO GovernorPromotions (GovernorPromotionType, Name, Description, Level, Column)
    VALUES ('BBG_AGRICULTURE_PROMOTION', 'LOC_GOVERNOR_PROMOTION_AGRICULTURE_NAME', 'LOC_GOVERNOR_PROMOTION_AGRICULTURE_DESCRIPTION', 1, 2);
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion)
    VALUES ('BBG_AGRICULTURE_PROMOTION', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');
DELETE FROM Types WHERE Type='GOVERNOR_PROMOTION_AQUACULTURE';
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_LIANG_AGRICULTURE_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'BBG_PLOT_HAS_VISIBLE_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_LIANG_AGRICULTURE_FOOD', 'YieldType', 'YIELD_FOOD'),
    ('BBG_LIANG_AGRICULTURE_FOOD', 'Amount', '1');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('BBG_PLOT_HAS_VISIBLE_RESOURCE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('BBG_PLOT_HAS_VISIBLE_RESOURCE', 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE');
INSERT INTO Types (Type, Kind) VALUES ('BBG_AGRICULTURE_PROMOTION', 'KIND_GOVERNOR_PROMOTION');
INSERT INTO GovernorPromotionSets (GovernorType, GovernorPromotion) VALUES ('GOVERNOR_THE_BUILDER', 'BBG_AGRICULTURE_PROMOTION');
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
    VALUES ('BBG_AGRICULTURE_PROMOTION', 'BBG_LIANG_AGRICULTURE_FOOD');

-- LII Park & Recreation : The City Park unique improvement can be built in the city. Yields 2 Appeal, 3 science, 2 culture, +1 amenity and +2 housing.  
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_PARKS_RECREATION';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_PARKS_RECREATION', 'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE');
UPDATE GovernorPromotions SET Level=2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_PARKS_RECREATION';      
UPDATE Improvement_YieldChanges SET YieldChange=2 WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND YieldType='YIELD_CULTURE';
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES
    ('IMPROVEMENT_CITY_PARK', 'YIELD_SCIENCE', 3);
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='CITY_PARK_WATER_AMENITY';
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_CITY_PARK_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_CITY_PARK_HOUSING', 'Amount', 2);
INSERT INTO ImprovementModifiers (ImprovementType, ModifierID) VALUES
    ('IMPROVEMENT_CITY_PARK', 'BBG_CITY_PARK_HOUSING');
DELETE FROM ImprovementModifiers WHERE ModifierID='CITY_PARK_GOVERNOR_CULTURE';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_DESERT_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_GRASS_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_PLAINS_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_SNOW_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType='IMPROVEMENT_CITY_PARK' AND TerrainType='TERRAIN_TUNDRA_HILLS';
UPDATE Improvements SET OnePerCity=1 WHERE ImprovementType='IMPROVEMENT_CITY_PARK';

-- RII Urbanism : +1 production on revealed resources in the city.
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';
UPDATE GovernorPromotions SET Level=2, Column=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_ZONING_COMMISSIONER';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_ZONING_COMMISSIONER', 'BBG_AGRICULTURE_PROMOTION');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_LIANG_PROD_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'BBG_PLOT_HAS_VISIBLE_RESOURCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_LIANG_PROD_RESOURCES', 'YieldType', 'YIELD_PRODUCTION'),
    ('BBG_LIANG_PROD_RESOURCES', 'Amount', 1);
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
    ('GOVERNOR_PROMOTION_ZONING_COMMISSIONER', 'BBG_LIANG_PROD_RESOURCES');

-- MIII Water Work : +1 housing, +1 amenity per specialized district in the city.    
-- +1 housing for districts
DELETE FROM GovernorPromotionModifiers WHERE ModifierId='WATER_WORKS_NEIGHBORHOOD_HOUSING';
DELETE FROM GovernorPromotionModifiers WHERE ModifierId='WATER_WORKS_CANAL_AMENITY';
DELETE FROM GovernorPromotionModifiers WHERE ModifierId='WATER_WORKS_DAM_AMENITY';
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='WATER_WORKS_AQUEDUCT_HOUSING';
UPDATE ModifierArguments SET Value=1 WHERE ModifierId='WATER_WORKS_AQUEDUCT_HOUSING' AND Name='Amount';
INSERT INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
    ('GOVERNOR_PROMOTION_WATER_WORKS', 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER'),
    ('GOVERNOR_PROMOTION_WATER_WORKS', 'GOVERNOR_PROMOTION_PARKS_RECREATION');
UPDATE GovernorPromotions SET Level=3, Column=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_WATER_WORKS';
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('BBG_LIANG_AMENITY', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('BBG_LIANG_AMENITY', 'Amount', 1);
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
    ('GOVERNOR_PROMOTION_WATER_WORKS', 'BBG_LIANG_AMENITY');
    
-- Fishery moved to tech tree
UPDATE Improvements SET TraitType=NULL WHERE ImprovementType='IMPROVEMENT_FISHERY';
DELETE FROM ImprovementModifiers WHERE ImprovementType='IMPROVEMENT_FISHERY';
DELETE FROM Modifiers WHERE ModifierId='AQUACULTURE_CAN_BUILD_FISHERY';
DELETE FROM ModifierArguments WHERE ModifierId='AQUACULTURE_CAN_BUILD_FISHERY';
UPDATE Improvements SET PrereqTech='TECH_CARTOGRAPHY' WHERE ImprovementType='IMPROVEMENT_FISHERY';
