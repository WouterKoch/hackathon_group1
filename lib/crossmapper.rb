require "csv"
require_relative "crossmapper/version"

class Crossmapper
  def initialize(input_path, output_path)
    @input = input_path
    @output = output_path
  end

  def run
    ingested_list = CSV.parse(input_path).each do |r|
      puts r 
    end
  end
end
