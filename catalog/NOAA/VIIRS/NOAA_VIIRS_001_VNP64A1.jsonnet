local id = 'NOAA/VIIRS/001/VNP64A1';
local subdir = 'NOAA/VIIRS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'VNP64A1: Burned Area Monthly L4 Global 500m SIN Grid',
  version: '1',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The daily Suomi National Polar-Orbiting Partnership (Suomi NPP) NASA Visible
    Infrared Imaging Radiometer Suite (VIIRS) Burned Area (VNP64A1) Version 1
    data product is a monthly, global gridded 500m product containing per-pixel
    burned area and quality information. The VNP64 burned area mapping approach
    employs 750m VIIRS imagery coupled with 750m VIIRS active fire
    observations.

    VIIRS bands that are both sensitive and insensitive to biomass burning are
    used to detect changes caused by fire and to differentiate them from other
    types of change.

    Documentation:

    * [User's Guide](https://lpdaac.usgs.gov/documents/1330/VNP64A1_User_Guide_V1.pdf)

    * [Algorithm Theoretical Basis Document (ATBD)](https://lpdaac.usgs.gov/documents/572/VNP64A1_ATBD_V1.pdf)

    * [General Documentation](https://lpdaac.usgs.gov/products/vnp64a1v001/)

    * [Land Product Quality Assessment website](https://landweb.modaps.eosdis.nasa.gov/NPP_QA/)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.5067/VIIRS/VNP64A1.001',
    },
  ],
  keywords: [
    'burn',
    'land',
    'nasa',
    'noaa',
    'surface',
    'viirs',
  ],
  providers: [
    ee.producer_provider('NASA LP DAAC at the USGS EROS Center', 'https://doi.org/10.5067/VIIRS/VNP64A1.001'),
    ee.host_provider(self_ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C1632559364-LPDAAC_ECS',
  ],
  extent: ee.extent_global('2014-01-01T00:00:00Z', '2019-01-01T00:00:00Z'),
  summaries: {
    gsd: [
      500.0,
    ],
    platform: [
      'Suomi NPP',
    ],
    instruments: [
      'VIIRS',
    ],
    'eo:bands': [
      {
        name: 'Burn_Date',
        description: |||
          Ordinal day of burn (1-366) for each 500-m grid cell.
        |||,
      },
      {
        name: 'Burn_Date_Uncertainty',
        description: |||
          Estimated uncertainty in date of burn, in days. Unburned, unmapped,
          and water grid cells are masked out.
        |||,
        'gee:units': '%',
      },
      {
        name: 'QA',
        description: 'Quality Assurance Indicators',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'land/water state',
              bit_count: 1,
              values: [
                {
                  description: 'water grid cell',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'land grid cell',
                },
              ],
              first_bit: 0,
            },
            {
              description: |||
                Valid data flag (0 = false, 1 = true). A value of 1 indicates
                that there was sufficient valid data in the reflectance time
                series for the grid cell to be processed.
              |||,
              bit_count: 1,
              values: [
                {
                  description: 'false',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'true',
                },
              ],
              first_bit: 1,
            },
            {
              description: |||
                Shortened mapping period (0 = false, 1 = true). This flag
                indicates that the period of reliable mapping does not encompass
                the full one-month product period.
              |||,
              bit_count: 1,
              values: [
                {
                  description: 'false',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'true',
                },
              ],
              first_bit: 2,
            },
            {
              description: |||
                Grid cell was relabeled during the contextual relabeling phase
                of the algorithm (0 = false, 1 = true).
              |||,
              bit_count: 1,
              values: [
                {
                  description: 'false',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'true',
                },
              ],
              first_bit: 3,
            },
            {
              description: 'Spare bit set to 0',
              bit_count: 1,
              values: [
                {
                  description: 'Spare bit',
                  value: 0,
                },
              ],
              first_bit: 4,
            },
            {
              description: |||
                Special condition code reserved for unburned grid cells. This
                code provides an explanation for any grid cells that were
                summarily classified as unburned by the detection algorithm due
                to special circumstances.
              |||,
              bit_count: 3,
              values: [
                {
                  description: 'burned, unmapped, or water grid cells',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Valid observations spaced too sparsely in time',
                },
                {
                  value: 2,
                  description: |||
                    Too few training observations or insufficient spectral
                    separability between burned and unburned classes.
                  |||,
                },
                {
                  value: 3,
                  description: 'Apparent burn date at limits of time series',
                },
                {
                  value: 4,
                  description: 'Apparent water contamination',
                },
                {
                  value: 5,
                  description: 'Persistent hot spot',
                },
                {
                  value: 6,
                  description: 'Reserved for future use',
                },
                {
                  value: 7,
                  description: 'Reserved for future use',
                },
              ],
              first_bit: 5,
            },
          ],
          total_bit_count: 8,
        },
      },
      {
        name: 'First_Day',
        description: 'First day of the year of reliable change detection',
      },
      {
        name: 'Last_Day',
        description: 'Last day of the year of reliable change detection',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Last day',
        lookat: {
          lat: -89,
          lon: 38,
          zoom: 8,
        },
        image_visualization: {
          band_vis: {
            min: [
              250,
            ],
            max: [
              320,
            ],
            palette: [
             "#000080",
             "#0000D9",
             "#4000FF",
             "#8000FF",
             "#0080FF",
             "#00FFFF",
             "#00FF80",
             "#80FF00",
             "#DAFF00",
             "#FFFF00",
             "#FFF500",
             "#FFDA00",
             "#FFB000",
             "#FFA400",
             "#FF4F00",
             "#FF2500",
             "#FF0A00",
             "#FF00FF",
            ],
            bands: [
              'Last_Day',
            ],
          },
        },
      },
    ],
  },
  'sci:doi': '10.5067/VIIRS/VNP64A1.001',
  'sci:citation': |||
    Please visit [LP DAAC 'Citing Our Data' page](https://lpdaac.usgs.gov/citing_our_data)
    for information on citing LP DAAC datasets.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 30,
  },
  'gee:terms_of_use': |||
    LP DAAC NASA data are freely accessible; however, when an author
    publishes these data or works based on the data, it is requested that the
    author cite the datasets within the text of the publication and include a
    reference to them in the reference list.
  |||,
}
