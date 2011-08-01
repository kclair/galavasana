class RunCode 
  @queue = :code_queue
  def self.perform(code_id) 
    code = Code.find(code_id)
    code.run
  end
end
