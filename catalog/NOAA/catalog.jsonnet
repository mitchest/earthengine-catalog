local id = 'NOAA';
local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';

local basename = 'catalog';
local base_filename = basename + '.json';
local base_url = ee_const.catalog_base + 'NOAA/';
local parent_url = ee_const.catalog_base + 'catalog.json';
local self_url = base_url + base_filename;

local description = importstr 'description.md';
local gsm_description = importstr 'general_satellite_messages_description.md';

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.catalog,
  id: id,
  title: id,
  description: description + gsm_description,
  links: [
    ee.link.root(),
    ee.link.parent(parent_url),
    ee.link.self_link(self_url),
    ee.link.child_catalog('CDR', base_url),
    ee.link.child_catalog('CFSV2', base_url),
    ee.link.child_catalog('DMSP-OLS', base_url),
    ee.link.child_catalog('GOES', base_url),
    ee.link.child_catalog('NCEP_DOE_RE2', base_url),
    ee.link.child_catalog('NGDC', base_url),
    ee.link.child_catalog('NHC', base_url),
    ee.link.child_catalog('NWS', base_url),
    ee.link.child_catalog('VIIRS', base_url),
    ee.link.child_collection('NOAA_CFSR', base_url),
    ee.link.child_collection('NOAA_GFS0P25', base_url),
    ee.link.child_collection('NOAA_PERSIANN-CDR', base_url),
  ],
}
