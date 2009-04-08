class ResourcePath
  
  attr_writer :param
  
  def initialize(path, options = {})
    @path = path
    @param = options[:param]
  end
  
  def param
    @param ||= (0...8).map{65.+(rand(25)).chr}.join
  end
  
  def to_s
    @path.gsub('*', param)
  end
  
end