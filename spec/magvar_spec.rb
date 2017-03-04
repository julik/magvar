require 'spec_helper'
require 'ostruct'

describe Magvar do
  let(:xp_date) { Time.utc(2020, 1, 1) }
  let(:older_date) { Time.utc(2015, 2, 22) }

  it 'computes a matching magnetic variation using at specified date/time' do
    murmansk = double(lat: 68.781751845, lon: 32.752029995)

    mv_deg = Magvar.variation_at(murmansk.lat, murmansk.lon, elev_km = 0, older_date)
    expect(mv_deg).to be_within(0.5).of(15.39)
  end

  it 'computes a matching magnetic variation for the given points' do
    murmansk = double(lat: 68.781751845, lon: 32.752029995)

    mv_deg = Magvar.variation_at(murmansk.lat, murmansk.lon, elev_km = 0, xp_date)
    expect(mv_deg).to be_within(0.5).of(16.35)

    svalbard = double(lat: 78.24622447, lon: 15.46383676)
    mv_deg = Magvar.variation_at(svalbard.lat, svalbard.lon, elev_km = 0, xp_date)
    expect(mv_deg).to be_within(0.5).of(9.5)
    
    ushuaya = double(lat: -54.9, lon: -68.3)
    mv_deg = Magvar.variation_at(ushuaya.lat, ushuaya.lon, elev_km = 0, xp_date)
    expect(mv_deg).to be_within(0.5).of(12.29)
  end
  
  it 'correctly computes magvar for points along a known route' do
    pt = double(lat:68.781751845, lon: 32.752029995, ident: "ULMM")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(16.35)
    
    pt = double(lat:68.743333, lon: 32.818333, ident: "RD MURMANSK NDB")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(16.35)

    pt = double(lat:68.616667, lon: 31.78, ident: "PELOR")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(15.78)

    pt = double(lat:68.503333, lon: 28.458333, ident: "KELEK")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(14.0)

    pt = double(lat:68.770833, lon: 27.619722, ident: "ADEXU")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(13.7)

    pt = double(lat:69.330833, lon: 25.752778, ident: "ENEXI")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(12.9)

    pt = double(lat:69.977581, lon: 23.371817, ident: "ATA ALTA VOR/DME")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(11.9)

    pt = double(lat:70.623054, lon: 19.011264, ident: "BETMA")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(9.59)

    pt = double(lat:72.083333, lon: 19.7, ident: "UVSAS")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(10.4)

    pt = double(lat:76.445833, lon: 18.398667, ident: "EDIKI")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(11.0)

    pt = double(lat:77.266667, lon: 18.043333, ident: "OTVIK")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(11.12)

    pt = double(lat:77.957972, lon: 17.718306, ident: "AMPIS")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(11.13)

    pt = double(lat:78.249733, lon: 15.401211, ident: "LON LONGYEAR NDB")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(9.5)

    pt = double(lat:78.24622447, lon: 15.46383676, ident: "ENSB Svalbard Longyear")
    expect(Magvar.variation_at(pt.lat, pt.lon, elev_km=0, xp_date)).to be_within(0.1).of(9.59)
  end
end

