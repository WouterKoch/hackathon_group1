require_relative 'spec_helper'

describe "Karousel" do
  before(:all) do
    @karousel = Karousel.new(ClientJobDummy, 20, 0)
  end

  before(:each) do
    ClientJobDummy.reset
  end

  it 'should have version' do
    Karousel.version.should =~ /^[\d]+\.[\d]+\.[\d]+$/
  end
  
  it "should initiate" do
    k = Karousel.new(ClientJobDummy, 20, 0)
    k.class.should == Karousel
  end

  it "should have size" do
    @karousel.size.should == 20
    @karousel.seats.size.should == 0
    @karousel.time_interval.should == 0
  end
  
  it "should run with block" do
    karousel = Karousel.new(ClientJobDummy, 20, 0)
    count = 0
    karousel.run do 
      count += 1
      if count < 10
        karousel.seats[1].class.should == Karousel::Job 
        karousel.seats[1].client_job.class.should == ClientJobDummy
      end
    end
  end

  it "should be able to get loaded with jobs" do 
    @karousel.seats.size.should == 0 
    @karousel.populate
    @karousel.seats.size.should == 20
    @karousel.seats[0].class == Karousel::Job
    @karousel.seats[0].status.should == Karousel::STATUS[:init]
  end



end
