Dir[File.join(File.dirname(__FILE__), 'karousel', '*.rb')].each {|f| require f}


class Karousel
  attr_reader :size, :seats, :time_interval
  STATUS = { init: 1, sent: 2, success: 3, failure: 4 }

  def self.version
    VERSION
  end

  def initialize(klass, size=10, time_interval = 0)
    @klass = klass
    @size = size
    @time_interval = time_interval
    @seats = []
  end

  def populate
    new_seats = []
    @klass.populate(@size - @seats.size).each do |inst|
      new_seats << Job.new(inst)
    end
    @seats = new_seats + @seats
  end

  def run(&block)
    populate
    until @seats.empty? do
      send_request
      sleep(@time_interval)
      check_response
      yield if block
      populate
    end
  end

  private

  def send_request
    @cursor = 0
    @seats.each_with_index do |job, index|
      if job.status == STATUS[:sent]
        @cursor = index
        break
      end
      job.send
    end
  end

  def check_response
    @seats = @seats[@cursor..-1] + @seats[0...@cursor] if @cursor != 0
    @seats.size.times do
      job = @seats.shift
      (job.status != :failure && job.finished?) ? job.process : 
        @seats.push(job)
    end
    @cursor = 0
  end

end
