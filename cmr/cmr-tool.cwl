cwlVersion: v1.2
class: CommandLineTool

# results in a STAC file called "cmr-results.json" being created with result of a CMR query
baseCommand: ["python", "cmr.py"]


requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: cmr.py
        entry: |-
          f = open("cmr-results.json", "x")
          stac_output = '''{"type":"FeatureCollection","stac_version":"1.0.0","numberMatched":1778145,"numberReturned":10,"features":[{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0005.m06.g001.L1_AQ.std.v02_48.G.200225123542.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[3.49,-41.94],[-13.3,-61.23],[22.49,-66.32],[25.46,-44.97],[3.49,-41.94]]]},"bbox":[-13.3,-66.32,25.46,-41.94],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0005.m06.g001.L1_AQ.std.v02_48.G.200225123542.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513132-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513132-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:05:26.000Z","start_datetime":"2002-09-01T00:05:26.000Z","end_datetime":"2002-09-01T00:11:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0005.m06.g001.L1_AQ.std.v02_48.G.200225123542.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0005.m06.g001.L1_AQ.std.v02_48.G.200225123542.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0005.m06.g001.L1_AQ.std.v02_48.G.200225123542.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513132-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0011.m06.g002.L1_AQ.std.v02_48.G.200225123542.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-13.5,-61.36],[-63.48,-73.55],[21.96,-87.77],[22.47,-66.48],[-13.5,-61.36]]]},"bbox":[-63.48,-87.773069,22.47,-61.36],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0011.m06.g002.L1_AQ.std.v02_48.G.200225123542.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513362-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513362-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:11:26.000Z","start_datetime":"2002-09-01T00:11:26.000Z","end_datetime":"2002-09-01T00:17:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0011.m06.g002.L1_AQ.std.v02_48.G.200225123542.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0011.m06.g002.L1_AQ.std.v02_48.G.200225123542.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0011.m06.g002.L1_AQ.std.v02_48.G.200225123542.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513362-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0017.m06.g003.L1_AQ.std.v02_48.G.200225123542.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-64.05,-73.57],[-122.98,-64.6],[-164.03,-70.79],[22.31,-87.93],[-64.05,-73.57]]]},"bbox":[-64.05,-89.7927,106.564964,-64.6],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0017.m06.g003.L1_AQ.std.v02_48.G.200225123542.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512634-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512634-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:17:26.000Z","start_datetime":"2002-09-01T00:17:26.000Z","end_datetime":"2002-09-01T00:23:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0017.m06.g003.L1_AQ.std.v02_48.G.200225123542.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0017.m06.g003.L1_AQ.std.v02_48.G.200225123542.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0017.m06.g003.L1_AQ.std.v02_48.G.200225123542.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512634-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0023.m06.g004.L1_AQ.std.v02_48.G.200225123558.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-123.24,-64.49],[-143.4,-45.77],[-166.94,-49.29],[-164.07,-70.63],[-123.24,-64.49]]]},"bbox":[-166.94,-70.63,-123.24,-45.77],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0023.m06.g004.L1_AQ.std.v02_48.G.200225123558.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512622-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512622-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:23:26.000Z","start_datetime":"2002-09-01T00:23:26.000Z","end_datetime":"2002-09-01T00:29:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0023.m06.g004.L1_AQ.std.v02_48.G.200225123558.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0023.m06.g004.L1_AQ.std.v02_48.G.200225123558.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0023.m06.g004.L1_AQ.std.v02_48.G.200225123558.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512622-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0029.m06.g005.L1_AQ.std.v02_48.G.200225123558.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-143.49,-45.62],[-152.6,-25.03],[-170.25,-27.7],[-166.97,-49.13],[-143.49,-45.62]]]},"bbox":[-170.25,-49.13,-143.49,-25.03],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0029.m06.g005.L1_AQ.std.v02_48.G.200225123558.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513117-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513117-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:29:26.000Z","start_datetime":"2002-09-01T00:29:26.000Z","end_datetime":"2002-09-01T00:35:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0029.m06.g005.L1_AQ.std.v02_48.G.200225123558.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0029.m06.g005.L1_AQ.std.v02_48.G.200225123558.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0029.m06.g005.L1_AQ.std.v02_48.G.200225123558.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513117-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0035.m06.g006.L1_AQ.std.v02_48.G.200225123558.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-152.65,-24.88],[-158.35,-3.68],[-174.11,-6.07],[-170.27,-27.54],[-152.65,-24.88]]]},"bbox":[-174.11,-27.54,-152.65,-3.68],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0035.m06.g006.L1_AQ.std.v02_48.G.200225123558.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513653-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513653-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:35:26.000Z","start_datetime":"2002-09-01T00:35:26.000Z","end_datetime":"2002-09-01T00:41:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0035.m06.g006.L1_AQ.std.v02_48.G.200225123558.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0035.m06.g006.L1_AQ.std.v02_48.G.200225123558.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0035.m06.g006.L1_AQ.std.v02_48.G.200225123558.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012513653-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0041.m06.g007.L1_AQ.std.v02_48.G.200225123558.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-158.39,-3.52],[-162.67,17.92],[-179.03,15.44],[-174.14,-5.91],[-158.39,-3.52]]]},"bbox":[-179.03,-5.91,-158.39,17.92],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0041.m06.g007.L1_AQ.std.v02_48.G.200225123558.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512954-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512954-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:41:26.000Z","start_datetime":"2002-09-01T00:41:26.000Z","end_datetime":"2002-09-01T00:47:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0041.m06.g007.L1_AQ.std.v02_48.G.200225123558.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0041.m06.g007.L1_AQ.std.v02_48.G.200225123558.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0041.m06.g007.L1_AQ.std.v02_48.G.200225123558.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512954-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0047.m06.g008.L1_AQ.std.v02_48.G.200225123558.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-162.7,18.08],[-166.28,39.56],[173.81,36.58],[-179.07,15.6],[-162.7,18.08]]]},"bbox":[173.81,15.6,-162.7,39.56],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0047.m06.g008.L1_AQ.std.v02_48.G.200225123558.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512197-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512197-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:47:26.000Z","start_datetime":"2002-09-01T00:47:26.000Z","end_datetime":"2002-09-01T00:53:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0047.m06.g008.L1_AQ.std.v02_48.G.200225123558.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0047.m06.g008.L1_AQ.std.v02_48.G.200225123558.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0047.m06.g008.L1_AQ.std.v02_48.G.200225123558.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512197-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0053.m06.g009.L1_AQ.std.v02_48.G.200225123618.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-166.31,39.72],[-169.56,61.17],[160.31,56.67],[173.74,36.74],[-166.31,39.72]]]},"bbox":[160.31,36.74,-166.31,61.17],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0053.m06.g009.L1_AQ.std.v02_48.G.200225123618.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512785-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512785-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:53:26.000Z","start_datetime":"2002-09-01T00:53:26.000Z","end_datetime":"2002-09-01T00:59:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0053.m06.g009.L1_AQ.std.v02_48.G.200225123618.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0053.m06.g009.L1_AQ.std.v02_48.G.200225123618.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0053.m06.g009.L1_AQ.std.v02_48.G.200225123618.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512785-GES_DISC.xml","type":"application/xml"}}},{"type":"Feature","id":"SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0059.m06.g010.L1_AQ.std.v02_48.G.200225123618.nc","stac_version":"1.0.0","stac_extensions":[],"collection":"SNDR13CHRP1.v2","geometry":{"type":"Polygon","coordinates":[[[-169.58,61.33],[-173.09,82.7],[122.01,72.18],[160.17,56.81],[-169.58,61.33]]]},"bbox":[122.01,56.81,-169.58,82.7],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items/SNDR13CHRP1.2:SNDR.SS1330.CHIRP.20020901T0059.m06.g010.L1_AQ.std.v02_48.G.200225123618.nc"},{"rel":"parent","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"collection","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"provider","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512969-GES_DISC.json"},{"rel":"via","href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512969-GES_DISC.umm_json"}],"properties":{"datetime":"2002-09-01T00:59:26.000Z","start_datetime":"2002-09-01T00:59:26.000Z","end_datetime":"2002-09-01T01:05:26.000Z"},"assets":{"data":{"href":"https://data.gesdisc.earthdata.nasa.gov/data/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0059.m06.g010.L1_AQ.std.v02_48.G.200225123618.nc","title":"Download SNDR.SS1330.CHIRP.20020901T0059.m06.g010.L1_AQ.std.v02_48.G.200225123618.nc"},"opendap":{"href":"https://sounder.gesdisc.eosdis.nasa.gov/opendap/CHIRP/SNDR13CHRP1.2/2002/244/SNDR.SS1330.CHIRP.20020901T0059.m06.g010.L1_AQ.std.v02_48.G.200225123618.nc","type":"application/x-netcdf","title":"The OPENDAP location for the granule. (GET DATA : OPENDAP DATA)"},"metadata":{"href":"https://cmr.earthdata.nasa.gov/search/concepts/G2012512969-GES_DISC.xml","type":"application/xml"}}}],"links":[{"rel":"self","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items?"},{"rel":"root","href":"https://cmr.earthdata.nasa.gov/cloudstac/"},{"rel":"next","method":"GET","href":"https://cmr.earthdata.nasa.gov/cloudstac/GES_DISC/collections/SNDR13CHRP1.v2/items?page=2"}],"context":{"returned":10,"limit":1000000,"matched":1778145}}
          '''
          f.write(stac_output)


inputs:
  cmr_collection:
    type: string
    inputBinding:
      position: 1
      prefix: --collection
  cmr_start_time:
    type: string
    inputBinding:
      position: 2
      prefix: --start-time
  cmr_stop_time:
    type: string
    inputBinding:
      position: 3
      prefix: --end-time
  cmr_edl_user:
    type: string?
    inputBinding:
      position: 4
      prefix: --edl-user
  cmr_edl_pass:
    type: string?
    inputBinding:
      position: 5
      prefix: --edl-pass

#stac json catalog are the outputs
outputs:
  cmr_results:
      outputBinding:
        glob: "cmr-results.json"
      type: File
