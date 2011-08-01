class Code < ActiveRecord::Base

  def queue
    self.set_status('queued')
    begin
      Resque.enqueue(RunCode, self.id)
    rescue
      logger.error 'could not queue code. redis not running?'
    end
  end

  def run
    self.set_status('started')
    begin
      self.output = eval(self.snippet)
      self.set_status('finished')
    rescue
      self.output = $!
      self.set_status('failed') 
    end
  end

  def runtime
    return 'unknown' if self.start.nil?
    finished = self.end || Time.now
    return (finished - self.start).to_s + ' seconds'
  end

  def save_from_params(params)
    if params[:status] == 'new'
      self.restart
    else
      orig_snippet = self.snippet
      self.update_attributes! params
      self.restart if orig_snippet != self.snippet
      self.save!
    end
  end

  protected

  def set_status(status)
    self.status = status
    case status
      when 'started'
        self.start = Time.now
      when 'finished'
        self.end = Time.now
      when 'failed'
        self.end = Time.now
    end
    self.save!
  end

  def restart
    return if status == 'queued' or status == 'started'
    self.start = nil
    self.end = nil
    self.output = nil
    self.queue
  end

end
