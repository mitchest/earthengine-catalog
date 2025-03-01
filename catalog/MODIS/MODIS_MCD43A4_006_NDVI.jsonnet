local id = 'MODIS/MCD43A4_006_NDVI';
local subdir = 'MODIS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
  ],
  id: id,
  title: 'MODIS Combined 16-Day NDVI',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The Normalized Difference Vegetation Index is
    generated from the Near-IR and Red bands of each scene as (NIR - Red) /
    (NIR + Red), and ranges in value from -1.0 to 1.0. This product is generated from the MODIS/006/MCD43A4 surface reflectance composites.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'modis',
    'ndvi',
    'usgs',
  ],
  providers: [
    ee.producer_provider('Google', 'https://earthengine.google.com/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2000-02-24T00:00:00Z', null),
  summaries: {
    'eo:bands': [
      {
        name: 'NDVI',
        description: 'Normalized Difference Vegetation Index',
        gsd: 463.312716528,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Colorized',
        lookat: {
          lat: 31.052933985705163,
          lon: -7.03125,
          zoom: 2,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              1.0,
            ],
            palette: [
              'FFFFFF',
              'CE7E45',
              'DF923D',
              'F1B555',
              'FCD163',
              '99B718',
              '74A901',
              '66A000',
              '529400',
              '3E8601',
              '207401',
              '056201',
              '004C00',
              '023B01',
              '012E01',
              '011D01',
              '011301',
            ],
            bands: [
              'NDVI',
            ],
          },
        },
      },
    ],
    NDVI: {
      minimum: -1.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
  },
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 1,
  },
  'gee:terms_of_use': |||
    MODIS data and products acquired through the LP DAAC have no restrictions on subsequent use, sale, or redistribution.
  |||,
  'gee:is_derived': true,
}
