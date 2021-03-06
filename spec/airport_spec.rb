require 'airport'

describe Airport do

  it 'will instruct a plane to land' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'prevents takeoff when weather is stormy' do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)
    airport = Airport.new
    expect{airport.takeoff}.to raise_error 'Cannot take off due to bad weather'
  end

  it 'prevents landing when weather is stormy' do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)
    airport = Airport.new
    expect{airport.land}.to raise_error 'Cannot land due to bad weather'
  end

  it 'cannot land when airport is full' do
  airport.land(plane)
  error = 'Cannot land since airport is full'
  expect { airport.land(double :plane) }.to raise_error error
  end

end
