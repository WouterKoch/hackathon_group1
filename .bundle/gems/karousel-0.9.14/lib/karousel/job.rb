class Karousel
  class Job
    attr_reader :client_job
    # STATUS = { init: 1, sent: 2, success: 3, failure: 4 }

    def initialize(client_job)
      unless client_job.is_a?(Karousel::ClientJob)
        raise TypeError.new('Unknown client job type') 
      end
      @client_job = client_job
    end

    def status
      @status = @client_job.status
      unless [1,2,3,4].include?(@status)
        raise TypeError.new('Status must be an integer between 1 and 4') 
      end
      @status
    end

    def status= (new_status)
      unless [1,2,3,4].include?(new_status)
        raise TypeError.new('Status must be an integer between 1 and 4') 
      end
      @client_job.status = new_status
    end

    def send
      is_ok = @client_job.send
      self.status = (is_ok ? STATUS[:sent] : STATUS[:failure])
      is_ok
    end

    def finished?
      @client_job.finished?
    end

    def process
      is_ok = @client_job.process
      self.status = (is_ok ? STATUS[:success] : STATUS[:failure])
      is_ok
    end

  end
end
