local id = 'ORTHO/Switzerland/SWISSIMAGE/10cm';
local subdir = 'ORTHO';

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
    ee_const.ext_sci,
  ],
  id: id,
  title: 'SWISSIMAGE 10 cm RGB imagery',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The SWISSIMAGE 10 cm orthophoto mosaic is an assembly of new color digital
    aerial images over the whole of Switzerland with a ground resolution of
    10 cm in the plains and the main alpine valleys and 25 cm in the Alps. It
    is updated annually.

    For more information, please see the [SWISSIMAGE10cm_FR documentation]
    (https://www.swisstopo.admin.ch/content/swisstopo-internet/fr/geodata/images/ortho/swissimage10/_jcr_content/contentPar/tabs_copy_copy/items/60_1569482292365/tabPar/downloadlist/downloadItems/67_1588752711524.download/Produktinfo_SWISSIMAGE10cm_FR.pdf)

    This RGB collection contains digital aerial images with three bands.
    Standard deviation for the precision in position: +/- 0.15 m for the ground
    sample distance of 0.1 m.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'orthophoto',
    'rgb',
    'swissimage',
    'swisstopo'
  ],
  providers: [
    ee.producer_provider(
    'Topography swisstopo',
    'https://www.swisstopo.admin.ch/en/geodata/images/ortho/swissimage10.html'
    ),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(45.8, 5.9, 47.8, 10.6,
                    '2017-01-01T00:00:00Z', null),
  summaries: {
    gsd: [
      0.1,
    ],
    'eo:bands': [
      {
        name: 'R',
        description: 'Red',
        center_wavelength: 0.63,
        'gee:wavelength': '619-651nm',
      },
      {
        name: 'G',
        description: 'Green',
        center_wavelength: 0.56,
        'gee:wavelength': '525-585nm',
      },
      {
        name: 'B',
        description: 'Blue',
        center_wavelength: 0.47,
        'gee:wavelength': '435-495nm',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'RGB',
        lookat: {
          lat: 7.4,
          lon: 46.3,
          zoom: 19,
        },
        image_visualization: {
          band_vis: {
            min: [
              11.0,
            ],
            max: [
              190.0,
            ],
            bands: [
              'R',
              'G',
              'B',
            ],
          },
        },
      },
    ],
    R: {
      minimum: 0.0,
      maximum: 255.0,
      'gee:estimated_range': false,
    },
    G: {
      minimum: 0.0,
      maximum: 255.0,
      'gee:estimated_range': false,
    },
    B: {
      minimum: 0.0,
      maximum: 255.0,
      'gee:estimated_range': false,
    },
  },
  'sci:citation': 'Copyright Federal Office of Topography swisstopo',
  'gee:terms_of_use': |||
    The free geodata and geoservices of swisstopo may be used, distributed and
    made accessible. Furthermore, they may be enriched and processed and also
    used commercially.

    A reference to the source is mandatory.
    please see the [Terms of use](
    https://www.swisstopo.admin.ch/en/home/meta/conditions/geodata/ogd.html)
  |||,
}
