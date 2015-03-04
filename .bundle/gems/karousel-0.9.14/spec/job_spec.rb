require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Karousel::Job do

  it "should instantiate" do 
    j = Karousel::Job.new(ClientJobDummy.new)
    j.class.should == Karousel::Job
    j.client_job.class.should == ClientJobDummy
  end

end

